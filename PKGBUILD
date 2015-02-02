# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=prelink-systemd
pkgver=1
pkgrel=1
pkgdesc='systemd units for prelink'
arch=('any')
url='https://github.com/Freso/PKGBUILDs'
license=('CC0')
depends=('prelink' 'systemd')
changelog=ChangeLog
source=('prelink.service'
        'prelink.timer'
        'https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt')
md5sums=('97cf93c0b23091c287b55a4157cf4173'
         'bc863b1646ec39cfa094294b3817b18a'
         '65d3616852dbf7b1a6d4b53b00626032')

package() {
	cd "$srcdir"
	install -d -m755 "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants"
	install -m644 -t "${pkgdir}/usr/lib/systemd/system" prelink.service prelink.timer
	ln -s ../prelink.timer "${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/prelink.timer"
	install -D -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
