# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154

# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
pkgname=boldline
pkgver=0.1.1
pkgrel=2
pkgdesc="Small utility to generate a bold line in a repeated line of text"
arch=('i686' 'x86_64')
url="https://github.com/zekesonxx/boldline"
license=('Apache')
groups=()
depends=()
makedepends=('git' 'rust' 'cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("boldline::git+https://github.com/zekesonxx/boldline#tag=${pkgver}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$srcdir/$pkgname" || exit
	cargo build --release
}

package() {
	install -D -m755 "${srcdir}/boldline/target/release/boldline" "${pkgdir}/usr/bin/boldline"
}
