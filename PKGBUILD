# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=paramano
pkgver=0.6.1
pkgrel=1
pkgdesc="Docking battery monitor and CPU governer controller (fork of trayfreq)"
arch=('i686' 'x86_64' 'armv6h')
url=(https://github.com/phillid/${pkgname})
license=('GPL')
depends=('gtk3' 'sudo')
makedepends=()
replaces="trayfreq-archlinux"
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/phillid/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('aa765d789fa159eea2fdbbdb8f568ba4f6bea7c7d7a26db8e46070abac0e142563002b27874e6859ec446908b14c809ad9df9d539e56eb394256e10c9cfdd1aa')
backup=('etc/paramano.conf')

build() {
	make -C "${srcdir}/${pkgname}-${pkgver}" all
}

package() {
	make -C "${srcdir}/${pkgname}-${pkgver}" install DESTDIR="${pkgdir}"
}
