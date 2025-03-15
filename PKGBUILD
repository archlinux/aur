# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-pywinctl"
_name="PyWinCtl"
pkgver=0.0.11
pkgrel=1
pkgdesc="Cross-Platform module to get info on and control windows on screen"
arch=('any')
url="https://pypi.org/project/pywinctl/"
license=('Apache 2.0')
provides=(python-pywinctl)
depends=()
optdepends=()
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9d945a908a41983174a64d2b41267c7130a4271ef4340a2ea9c25613b76d555d')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
