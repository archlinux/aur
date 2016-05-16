pkgname=xfce4-netload-plugin-git
_pkgname=${pkgname%-git}
pkgver=1.1.2.r66.gf0d2499
pkgrel=1
pkgdesc='A netload plugin for the Xfce pane'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel')
conflicts=('xfce4-netload-plugin')
provides=('xfce4-netload-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
source=('git://git.xfce.org/panel-plugins/xfce4-netload-plugin')
sha256sums=('SKIP')

build() {
	cd "$_pkgname"/

	./autogen.sh --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-maintainer-mode \
		--disable-debug
	make
}

package() {
	cd "$_pkgname"

	make DESTDIR="${pkgdir}" install
}

