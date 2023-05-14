# Maintainer: Joey Eamigh @JoeyEamigh on GitHub
pkgname=wayclip-manager-git
pkgver=0.1
pkgrel=1
pkgdesc="an opinionated Wayland package manager"
arch=('any')
url=""
license=('GPL')
groups=()
depends=('bemenu')
makedepends=('git' 'cargo-nightly')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('wayclip::git+https://github.com/JoeyEamigh/wayclip.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-manager-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-manager-git}"

	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-manager-git}"
	./install.sh
}

check() {
	cd "$srcdir/${pkgname%-manager-git}"
}

package() {
	cd "$srcdir/${pkgname%-manager-git}"
}
