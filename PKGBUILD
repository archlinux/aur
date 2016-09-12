# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Alexey Rochev <equeim at gmail dot com>

_pkgname=snw-plugin
pkgname="xfce4-${_pkgname}"
pkgver=0.8
pkgrel=1
url="https://github.com/equeim/snw-plugin"
pkgdesc="Xfce panel plugin to show StatusNotifierItems (AppIndicators)"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libdbusmenu-gtk2' 'xfce4-panel')
makedepends=('vala' 'python' 'intltool')
source=("${_pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('dd62c4f75221965a280e4b6c41ea785a7796a8d7be939327fe94b0835677b612')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf configure --prefix="/usr" --libdir="/usr/lib"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
