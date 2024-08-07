# Maintainer: Vhou-Atroph <vhouatroph@proton.me>
pkgname="tt-damage-calculator"
pkgver="4.3.1"
pkgrel=1
epoch=
pkgdesc="A damage calculator for Toontown Rewritten"
arch=(
"x86_64")
url="https://vhou.gloop.group/projects/gagcalc"
license=('GPL-3.0-only')
groups=()
depends=(
"python"
"tk")
makedepends=(
"cargo"
"maturin"
"python-installer"
"patchelf"
"python-wheel")
checkdepends=()
optdepends=(
"xdg-utils: in-app settings opening support")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Vhou-Atroph/$pkgname.git#tag=V$pkgver")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname"
	maturin build --release
}

package() {
	cd "$srcdir/$pkgname"
	python -m installer  --destdir="$pkgdir/" target/wheels/*.whl 
}
