# Maintainer: Louis Dalibard <ontake@ontake.dev>
# Contributor: Louis Dalibard <ontake@ontake.dev>
_pkgbase="ontake-nezumi-p"
pkgname="$_pkgbase-git"
pkgver=r3.g3b7639d
pkgrel=1
pkgdesc="A simple TUI for viewing Parisian public transport departure times"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/make-42/nezumi-p"
license=('GPL2')
groups=()
depends=()
makedepends=('cargo' 'git' 'rust')
optdepends=()
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/make-42/nezumi-p")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

pkgver() {
	cd ${srcdir}/nezumi-p
	echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/nezumi-p"
	cargo build --release
}

package() {
	cd ${srcdir}
	install -Dm755 "nezumi-p/target/release/nezumi-p" "${pkgdir}"/usr/bin/nezumi-p
}
