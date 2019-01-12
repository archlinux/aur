# Maintainer: Kevin Klement <klement@philos.umass.edu>
pkgname=terminal_dimensions-git
pkgver=r2.8e34b6f
pkgrel=1
pkgdesc="cli tool to report terminal dimensions in both cells and pixels"
arch=('x86_64')
url="https://github.com/dsanson/terminal_dimensions"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/dsanson/terminal_dimensions.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	gcc terminal_dimensions.c -o terminal_dimensions
}

package() {
	install -D "$srcdir/${pkgname%-git}/terminal_dimensions" "$pkgdir/usr/bin/terminal_dimensions"
}
