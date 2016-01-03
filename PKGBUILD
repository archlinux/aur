# Maintainer: Foppe Hemminga <foppe@foppe.org>

pkgname=nimsuggest-git
provides=('nimsuggest')
pkgver=0.1.0
pkgrel=2
pkgdesc='IDEtools for the Nim programming language'
arch=('x86_64' 'i686')
url="https://github.com/nim-lang/nimsuggest"
license=('BSD')
depends=('nim>=0.11.2')
makedepends=('nimble'
			 'git')
source=("git+https://github.com/nim-lang/nimsuggest.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/${pkgname%-*}"
    warning "In 14 lines from here the script might ask a question."
    msg "Please type 'y' when prompted."
    nimble build
}

package() {
    cd "$srcdir/${pkgname%-*}"
	install -Dm755 "nimsuggest" "$pkgdir/usr/bin/nimsuggest"
}

# vim:set ts=2 sw=2 et:
