# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=ppp-hook-pdnsd
pkgver=0.0.4
pkgrel=2
pkgdesc='Hook for ppp to add domain name servers to pdnsd (dns caching proxy)'
arch=('any')
depends=('pdnsd' 'ppp')
url='http://www.eworm.de/'
license=('GPL')
install=ppp-hook-pdnsd.install
source=('ip-up.sh'
	'ip-down.sh')
sha256sums=('24f2523e57a704db74e383b62e1574ac620ae568f5ae10f2facee80cc0728614'
            '55c808b63c4ba176237724705a51412fd2cc52d58dedfbea77921bea04586165')

package() {
	install -D -m 0755 ${srcdir}/ip-up.sh ${pkgdir}/etc/ppp/ip-up.d/01-pdnsd.sh
	install -D -m 0755 ${srcdir}/ip-down.sh ${pkgdir}/etc/ppp/ip-down.d/01-pdnsd.sh
}

