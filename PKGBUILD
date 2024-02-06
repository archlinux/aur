# Maintainer: Kherim Willems <aur@kher.im>

pkgname=python-types-pyserial
_pkgname=types-pyserial
pkgver=3.5.0.20240205
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('dc2fbf0b5ca5e6c3eae5054f871b41c026c946e65e4b1a6e4bca959a24c21554')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
