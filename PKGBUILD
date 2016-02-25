# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=xfce4-snw-plugin
pkgver=0.7
pkgrel=1
pkgdesc="Xfce panel plugin to show StatusNotifierItems (AppIndicators)"
url="https://github.com/equeim/xfce4-snw-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('xfce4-panel' 'libdbusmenu-gtk2')
makedepends=('vala' 'python')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/equeim/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('32eade4613ade188314ef4f4dafa7986dc948f2447d71ee121cbf59727e5afbb')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./waf configure build --prefix="/usr"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
