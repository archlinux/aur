# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Alexey Rochev <equeim at gmail dot com>

pkgname=xfce4-snw-plugin
pkgver=0.7.1
pkgrel=1
pkgdesc="Xfce panel plugin to show StatusNotifierItems (AppIndicators)"
url="https://github.com/equeim/xfce4-snw-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('xfce4-panel' 'libdbusmenu-gtk2')
makedepends=('vala' 'python' 'intltool')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('5af533bdac4ac114ef73f5bfd915a6d49abbb42b12abdda16289902724894e6b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./waf configure build --prefix="/usr" --libdir="/usr/lib"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
