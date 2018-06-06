# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=paramano
pkgver=0.71
pkgrel=1
pkgdesc="Docking battery monitor and CPU governer controller (fork of trayfreq)"
arch=('i686' 'x86_64' 'armv6h')
url="https://git.nah.nz/${pkgname}/"
license=('GPL')
depends=('gtk3' 'sudo')
source=("https://git.nah.nz/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('03b885a35429d04b6ce9212b7fe95e7f7e2d7e6fdbae7ec08f47bed1ff94f2d6e596f462d511ed5ae8f29f82c272b4614701661f9ca1613d33fb14e97b8db2c6')
backup=('etc/paramano.conf')

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}" all
}

package() {
	make -C "${srcdir}/${pkgname}-${pkgver}" install DESTDIR="${pkgdir}"
}
