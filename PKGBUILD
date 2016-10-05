# Maintainer: Matt Parnell <parwok@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: tobias <tobias at archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-clipman-plugin-classic
pkgver=1.2.6
pkgrel=1
pkgdesc='A clipboard plugin for the Xfce4 panel. Classic 1.2.6 version without the scroll bug'
arch=('i686' 'x86_64')
license=('GPL')
url='http://goodies.xfce.org/projects/panel-plugins/xfce4-clipman-plugin'
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libunique' 'libxtst' 'qrencode')
conflicts=('xfce4-clipman-plugin' 'xfce4-clipman-plugin-git')
provides=('xfce4-clipman-plugin')
makedepends=('xfce4-dev-tools' 'intltool' 'git')
options=('!libtool')
install=xfce4-clipman-plugin.install
source=("git://git.xfce.org/panel-plugins/xfce4-clipman-plugin#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd xfce4-clipman-plugin/

	./autogen.sh
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-unique \
		--enable-maintainer-mode \
		--disable-debug
	make
}

package() {
	cd xfce4-clipman-plugin/

	make DESTDIR="${pkgdir}" install
}

