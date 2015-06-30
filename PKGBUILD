# Maintainer: John Piasetzki <john@piasetzki.name>
pkgname=dyndns
pkgver=1.0.1
pkgrel=2
pkgdesc="dyndns (Dynamic DNS) syncing shell script with systemd script"
arch=('any')
url="http://john.piasetzki.name/projects/dyndns"
license=('unknown')
groups=()
depends=('curl')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://john.piasetzki.name/projects/$pkgname/$pkgname-$pkgver"
        'dyndns.service' 'dyndnsd')
noextract=
md5sums=('17312c8594295c723f8d4021b282f168'
         'bdb2511c0e00fa8a346dfce72887e7a7'
         '2fc56497ed300dc095e65ecfd0391512')


package() {
	install -Dm755 $pkgname-$pkgver $pkgdir/usr/bin/dyndns
	install -D -m644 ${srcdir}/dyndnsd ${pkgdir}/etc/conf.d/dyndnsd
	install -D -m644 ${srcdir}/dyndns.service ${pkgdir}/usr/lib/systemd/system/dyndns.service
}
