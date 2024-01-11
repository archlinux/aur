# Maintainer: Kherim Willems <aur@kher.im>

pkgname=python-types-pyserial
_pkgname=types-pyserial
pkgver=3.5.0.20240106
pkgrel=1
pkgdesc="Typing stubs for pyserial"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('Apache')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d9134c34edf08d5d5e57c620f9ff635f0103a8d8c4d2c6385624fe28f1b7e491')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
