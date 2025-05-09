# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.3.2
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
source=("https://github.com/Diaoul/subliminal/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('385149cd189289283b665c4dd6205f74788628042a51ddefb22dc77b85467d61')
sha512sums=('479894e5c435cfef57481078384938fe58bc7c9d6e7922aaf313cbcd316a098491f07bf0afc6879f83abf97201edd9b2eb1f90f4cbe18fe8a34ac2b577671eb7')
b2sums=('2a1b9735fc95957c614ee438934f0639e77b7a4562a54af6f89081a3dc994f49e33ab0ebf51efe04790d904586aad1f30b71a714725ea99875ad3815faac9a26')

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
