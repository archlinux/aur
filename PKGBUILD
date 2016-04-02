# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=paramano
pkgver=0.7
pkgrel=1
pkgdesc="Docking battery monitor and CPU governer controller (fork of trayfreq)"
arch=('i686' 'x86_64' 'armv6h')
url=https://github.com/phillid/${pkgname}
license=('GPL')
depends=('gtk3' 'sudo')
makedepends=()
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/phillid/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('75624241cacad50bb8934856ab760334f973dd0f6c61e51274d58382ce2ec85acd4e013a677f6c466eb2096c3fa39cda7b76e5553f11733006c0272b7c3fd49d')
backup=('etc/paramano.conf')

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}" all
}

package() {
	make -C "${srcdir}/${pkgname}-${pkgver}" install DESTDIR="${pkgdir}"
}
