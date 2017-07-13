pkgname=hatexmpp-git
pkgver=r255.a03e9d8
pkgrel=2
pkgdesc="XMPP fuse filesystem"
arch=(i686 x86_64)
url="https://github.com/l29ah/hatexmpp"
license=('custom:WTFPL')
depends=()
makedepends=('git')
source=('git://github.com/l29ah/hatexmpp.git')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
sha256sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm0755 hatexmpp "$pkgdir"/usr/bin/hatexmpp
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/hatexmpp/LICENSE
}
