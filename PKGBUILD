# Maintainer: spookyintheam <spookyintheam@proton.me>

_pkgname='catppuccin-cursors'
pkgname=${_pkgname}-git
pkgver=0.2.0.r0.g31a2848
pkgrel=1
pkgdesc="Soothing pastel mouse cursors"
arch=('any')
url="https://github.com/catppuccin/cursors"
license=('GPL2')
makedepends=('inkscape' 'xorg-xcursorgen')   
conflicts=("$_pkgname-mocha" "$_pkgname-macchiato" "$_pkgname-frappe" "$_pkgname-latte")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^.*v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make build
}

package() {
	cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"
}
