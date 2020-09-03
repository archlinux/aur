# Maintainer: nsz32 <nszabo2 at gmail dot com>

pkgname=xfce4-docklike-plugin-git
pkgver=20200904
pkgrel=1
pkgdesc='A modern, docklike, minimalist taskbar for XFCE'
arch=('i686' 'x86_64')
url='https://github.com/nsz32/docklike-plugin'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo' 'glib2')
makedepends=('git' 'xfce4-dev-tools' 'intltool')

source=(git://github.com/nsz32/docklike-plugin)
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/docklike-plugin"
	git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
	cd "${srcdir}/docklike-plugin"
	./autogen.sh
}

build() {
	cd "${srcdir}/docklike-plugin"
	make
}

package() {
	cd "${srcdir}/docklike-plugin"
	make DESTDIR="${pkgdir}" install
}
