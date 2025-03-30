# Maintainer: swweetp <swweetp@outlook.com>

pkgname=python-uptime
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=3.0.1
pkgrel=1
epoch=
pkgdesc="Cross-platform way to retrieve system uptime and boot time"
arch=('x86_64')
url="https://github.com/Cairnarvon/uptime"
license=('BSD-2-Clause')
groups=()
depends=(python glibc)
makedepends=(python-build python-installer python-wheel)
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
sha256sums=('7c300254775b807ce46e3dcbcda30aa3b9a204b9c57a7ac1e79ee6dbe3942973')
validpgpkeys=()

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 COPYING.txt -t $pkgdir/usr/share/licenses/$pkgname/
}
