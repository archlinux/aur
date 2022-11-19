# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=paramano
pkgver=0.72
pkgrel=1
pkgdesc="Docking battery monitor and CPU governer controller (fork of trayfreq)"
arch=('i686' 'x86_64' 'armv6h')
url="https://gitlab.com/dphillips/${pkgname}"
license=('GPL')
depends=('gtk3' 'sudo')
source=("git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')
backup=('etc/paramano.conf')

build() {
	make -C "${srcdir}/${pkgname}" all
}

package() {
	make -C "${srcdir}/${pkgname}" install DESTDIR="${pkgdir}"
}
