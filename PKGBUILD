# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.3.0
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>=3.0.0'
         'python-babelfish>=0.6.1'
         'python-knowit>=0.5.5'
         'python-platformdirs>=3'
         'python-beautifulsoup4>=4.4.0'
         'python-pysubs2>=1.7'
         'python-requests>=2.0'
         'python-click>=8.0'
         'python-click-option-group>=0.5.6'
         'python-dogpile.cache>=1.0'
         'python-stevedore>=3.0'
         'python-chardet>=5.0'
         'python-srt>=3.5'
         'python-tomlkit>=0.13.2'
         'python-rarfile>=2.7')
makedepends=('git'
             'python-setuptools')
source=("https://github.com/Diaoul/subliminal/releases/download/2.3.0/${pkgname}-${pkgver}.tar.gz")
sha256sums=('428073ce98f6a967207615a4c58732fdcb80819fdd8b0404f8dd2ebea18666eb')
sha512sums=('3aad167f9fe0087b2c21054e6f2d82ace9578e4256582a383b1dcf9c33ad58f5217522f2a724be367bbfe5b7d7259592767c84a24a07a857724f76f618f33774')
b2sums=('f046992a31a2def358ab125b0a352b01d0ddc3fc5ca22cbee46bd0f82ec55365544b91da55875506d4f9caa964a1162c746af5c5b1968e34e4f09b7dc71b3469')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -v -m755 -d "${pkgdir}/usr/share/licenses/subliminal"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/subliminal/"
}
