# Maintainer: koneu <koneu93 at googlemail dot com>

pkgname='power.sh'
pkgver='1'
pkgrel=1
pkgdesc='tiny automated power settings'
license=('CC0')
source=('power.sh' 'power.sh.rules' 'power.sh.service' 'power.sh.sleep.service')
depends=('systemd' 'sh')
arch=('any')
md5sums=('33a7b13b276192125f5f3ec64cac759a'
         'e75bf13f0d7bc46dd03db58905013cd0'
         '5f814dc5093bef00dfc3c96f70f90e26'
         '07a8380291782b467d60bc6b78769120')

package() {
	install -Dm755 "${srcdir}/power.sh" "${pkgdir}/usr/share/power.sh"
	install -Dm644 "${srcdir}/power.sh.rules" "${pkgdir}/usr/lib/udev/rules.d/power.sh.rules"
	install -Dm644 "${srcdir}/power.sh.service" "${pkgdir}/usr/lib/systemd/system/power.sh.service"
	install -Dm644 "${srcdir}/power.sh.sleep.service" "${pkgdir}/usr/lib/systemd/system/sleep.target.wants/power.sh.sleep.service"
}
