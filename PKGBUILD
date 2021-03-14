# Maintainer : hayao@fascode.net
# Contributer: nsz32 <nszabo2 at gmail dot com>

pkgname="xfce4-docklike-plugin"
pkgver="0.2.0"
pkgrel=1
pkgdesc='A modern, docklike, minimalist taskbar for XFCE'
arch=('i686' 'x86_64')
url='https://github.com/nsz32/docklike-plugin'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo' 'glib2')
makedepends=('xfce4-dev-tools' 'intltool')
conflicts=("${pkgname}-git")

source=("https://github.com/davekeogh/xfce4-docklike-plugin/archive/v${pkgver}.zip")
sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/xfce4-docklike-plugin-${pkgver}"
	./autogen.sh
}

build() {
	cd "${srcdir}/xfce4-docklike-plugin-${pkgver}"
	make
}

package() {
	cd "${srcdir}/xfce4-docklike-plugin-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
