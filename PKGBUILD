# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=phasher
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple CLI program hashing passwords into PHC strings"
arch=("x86_64" "aarch64")
url="https://github.com/chardoncs/phasher"
license=('MIT')
groups=()
depends=()
makedepends=(
	rust
    cargo
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
sha256sums=()
validpgpkeys=()

_srcroot="${pkgname}-${pkgver}-${pkgrel}"

build() {
	local srcroot="$srcdir/$_srcroot"

	if [ ! -d $srcroot ]; then
		mkdir $srcroot
	fi

	pushd $srcroot

	cargo install ${pkgname}@${pkgver} --locked --target-dir $srcroot/ --root $srcroot/
}

package() {
	local srcroot="$srcdir/$_srcroot"

	install -Dm755 $srcroot/bin/$pkgname ${pkgdir}/usr/bin/$pkgname
}
