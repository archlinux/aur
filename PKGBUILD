# Maintainer: Mathilde <github.com/Mathilde411>
# Maintainer: Monax (SMNX) <github.com/sleepy-monax>

_repo="paper-muncher"

pkgname="$_repo"
pkgver=0.5.0
pkgrel=1
pkgdesc="Convert web pages (HTML, XHTML, or SVG) into printable or viewable documents like PDFs or images."
arch=("x86_64")
url="https://odoo.github.io/paper-muncher"
license=("LGPL-3.0-or-later")
depends=("sdl3" "liburing" "libseccomp")
makedepends=("base-devel" "git" "ninja" "llvm" "clang" "lld" "jq" "cutekit")

source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/odoo/paper-muncher/tarball/v0.5.0")
sha256sums=("54295d5bb4228e86ee02ffc1a37010f6d08ea067a77386c13a9d1beac3e6430d")

build() {
	cd "$srcdir"/*/
	ck build --release --prefix="/usr" "$_repo"
}

check() {
	cd "$srcdir"/*/
	ck test --release --prefix="/usr"
}

package() {
	cd "$srcdir"/*/
	ck package --release --prefix="/usr" --sysroot="$pkgdir" "$_repo"
}
