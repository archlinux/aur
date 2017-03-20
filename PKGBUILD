# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Alexey Rochev <equeim at gmail dot com>

_pkgname=snw-plugin
pkgname="mate-${_pkgname}"
pkgver=0.10.0
pkgrel=1
pkgdesc="Mate panel plugin to show StatusNotifierItems (AppIndicators)"
url="https://github.com/equeim/snw-plugin"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libdbusmenu-gtk3' 'mate-panel')
makedepends=('vala' 'python' 'intltool')
source=("${_pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('e34241ce1b4a1d4f85bf12d05ecafce62032cdfd26ac9df247a79111cc79e343')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf configure --prefix="/usr" --libdir="/usr/lib" --mate --gtk3
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
