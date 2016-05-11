# Maintainer: Christopher Woodruff <cswoodruff@gmail.com>

pkgname=python2-livereload
_pkgname=livereload
pkgver=2.4.1
pkgrel=2
pkgdesc='Python LiveReload is an awesome tool for web developers'
arch=('any')
url="https://pypi.python.org/pypi/livereload"
license=('BSD')
depends=('python2-six' 'python2-tornado')
makedepends=('python2-setuptools')
replaces=('livereload')
conflicts=('livereload')
source=("https://pypi.python.org/packages/source/l/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('e79d3de78f11b459392f347f7bb20309')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
