# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=fontconfig-good-defaults
pkgver=20150909
pkgrel=1
pkgdesc='Enhanced default settings for Fontconfig.'
arch=('any')
url='https://aur.archlinux.org/packages/fontconfig-good-defaults/'
license=('custom:Public Domain')
depends=('fontconfig')
source=(10-good-defaults.conf fontconfig-good-defaults.sh LICENSE)
sha512sums=('93de817788d243f3ca278bbf19b56a431ca9ee622933c715fd73e32d8401c4d2d195b21b5615f8796bb95c985ddb415821cc0973c18cd31c5e0c445d94b89dc6'
            '3adb17e2448be560dac7be226cc1f5783d1dd383e35858549cc351341be86829ea8b79c3c933620be841157c38dfc44a84ec272ce9b1be734cdcaace1f1eac68'
            '57f083acfdb3b05be097f27d8df8afb77820c61ca138f097f22564d3e10dd0b713aaf02e421d6ab8223b6fb462ad16833ce08a0f10ed17a0d3a82f34b9494df0')
package()
{
	cd "$srcdir"

	install -Dm644 10-good-defaults.conf "$pkgdir/etc/fonts/conf.avail/10-good-defaults.conf"

	install -d "$pkgdir/etc/fonts/conf.d/"
	ln -s '../conf.avail/10-good-defaults.conf' "$pkgdir/etc/fonts/conf.d/10-good-defaults.conf"

	install -Dm755 fontconfig-good-defaults.sh "$pkgdir/etc/profile.d/fontconfig-good-defaults.sh"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
