# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=paramano
pkgver=0.71
pkgrel=1
pkgdesc="Docking battery monitor and CPU governer controller (fork of trayfreq)"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/phillid/${pkgname}"
license=('GPL')
depends=('gtk3' 'sudo')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phillid/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c8589c85d95e142ec698f3218e2be50474daa1394bcfef05034026be24a6d10ff4ee9b4ac3d9f48d56ff0e74a13dc756f6eda63290e5dc2a127767eee2679fa3')
backup=('etc/paramano.conf')

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}" all
}

package() {
	make -C "${srcdir}/${pkgname}-${pkgver}" install DESTDIR="${pkgdir}"
}
