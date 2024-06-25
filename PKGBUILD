# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.2.0
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>=3.0.0'
         'python-babelfish>=0.6.1'
         'python-enzyme>=0.5.0'
         'python-platformdirs>=3'
         'python-beautifulsoup4>=4.4.0'
         'python-pysubs2>=1.7'
         'python-requests>=2.0'
         'python-click>=8.0'
         'python-click-option-group>=0.5.0'
         'python-dogpile.cache>=1.0'
         'python-stevedore>=3.0'
         'python-chardet>=5.0'
         'python-srt>=3.5'
         'python-tomli>=2'
         'python-rarfile>=2.7')
makedepends=('git'
             'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f103380d1e2ef09b7cb194beff5bf4a19492d5f3bbf336dec03a7451c992a593')
sha512sums=('5df2074c422885535cf6d12a8f561015fd22e0538bce2098060857b2022935a8edd776713434c7c542973e9ef3606bebc6d7b540f8fec61e61a7e5cf8c5803cb')
b2sums=('6a54666c7366b35134f782f0a96d134f95b9905e5342ebe242381dcafee9b4c2ed6029c4f578e75b6329015872e4806e77a77e5054966c4b1ec40ce6b9643027')

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
