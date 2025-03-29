# Maintainer: swweetp <swweetp@outlook.com>

pkgname=python-tkinter-tooltip
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=3.1.2
pkgrel=1
epoch=
pkgdesc="An easy and customisable ToolTip implementation for Tkinter"
arch=('any')
url="https://github.com/gnikit/tkinter-tooltip"
license=('MIT')
groups=()
depends=(python python-setuptools-scm python-importlib-metadata)
makedepends=(python-build python-installer python-wheel python-flit-scm)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('dac8a6720c851936dfea2d96f90920a4dac31b46b78379c5e0ef0b6ed8af2964')
validpgpkeys=()

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
