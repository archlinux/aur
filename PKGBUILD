pkgname=htmail-view
pkgver=v0.6.r3.59e04aa
pkgrel=1
pkgdesc="Web page renderer based on WebKit"
arch=(any)
url="https://github.com/liske/htmail-view"
license=('GPL2')
depends=('perl' 'perl-browser-open' 'perl-uri' 'glib-perl' 'perl-gtk3' 'perl-gtk3-webkit')
optdepends=('wmctrl')
source=("git://github.com/liske/htmail-view")

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
sha256sums=('SKIP')

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
