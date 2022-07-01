# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-iso8601
_name="${pkgname#python2-}"
pkgver=0.1.16
pkgrel=1
pkgdesc='Simple module to parse ISO 8601 dates (legacy Python 2 version)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('36532f77cc800594e8f16641edae7f1baf7932f05d8e508545b95fc53c6dc85b')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --skip-build --optimize=1 --root="${pkgdir}"
  install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
