# Maintainer: Kevin Klement <klement@philos.umass.edu>
pkgname=termpdf-git
pkgver='r147.4616797'
pkgrel=2
pkgdesc="barebones graphical pdf/djvu/cbr/image viewer that works inside some terminals, e.g. kitty"
arch=('any')
url="https://github.com/dsanson/termpdf"
license=('MIT')
depends=('bc' 'poppler' 'djvulibre' 'ghostscript' 'libtiff' 'unrar' 'imagemagick' 'kitty' 'terminal_dimensions-git')
makedepends=('git')
optdepends=('libsixel: support for terminals besides kitty, if they are libsixel compatible')
source=('git+https://github.com/dsanson/termpdf.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D "$srcdir/${pkgname%-git}/termpdf" "$pkgdir/usr/bin/termpdf"
    install -D "$srcdir/${pkgname%-git}/tpdfc" "$pkgdir/usr/bin/tpdfc"
}
