# Maintainer: Christopher Arndt <aur at chrisarndt dot de>

_name=colorzero
pkgname="python-${_name}"
pkgver=1.1
pkgrel=2
pkgdesc="A simple to use and pythonic color manipulation library"
arch=('any')
url="https://${_name}.readthedocs.org/"
license=('BSD')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('acba47119b5d8555680d3cda9afe6ccc5481385ccc3c00084dd973f7aa184599')


build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package_python-colorzero() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  # license
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
