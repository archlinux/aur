# Maintainer : hayao@fascode.net
# Contributer: nsz32 <nszabo2 at gmail dot com>, bittin

pkgname="xfce4-docklike-plugin"
pkgver="0.4.0"
pkgrel=3
pkgdesc='A modern, docklike, minimalist taskbar for XFCE'
arch=('i686' 'x86_64' "aarch64")
url='https://gitlab.xfce.org/panel-plugins/xfce4-docklike-plugin'
license=('GPL3')
depends=('xfce4-panel>=4.4' 'libwnck3' 'libxfce4ui' 'gtk3' 'cairo' 'glib2' "exo")
makedepends=('xfce4-dev-tools' 'intltool')
conflicts=("${pkgname}-git" "${pkgname}-ng-git")
dirname="xfce4-docklike-plugin-xfce4-docklike-plugin-${pkgver}"

source=(
	#"https://github.com/davekeogh/xfce4-docklike-plugin/archive/v${pkgver}.zip"
	"${url}/-/archive/xfce4-docklike-plugin-${pkgver}/xfce4-docklike-plugin-xfce4-docklike-plugin-${pkgver}.tar.gz"
)

sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/${dirname}"
	./autogen.sh
        --prefix=/usr \




}

build() {
	cd "${srcdir}/${dirname}"
	make
}

package() {
	cd "${srcdir}/${dirname}"
	make DESTDIR="${pkgdir}" install
}
