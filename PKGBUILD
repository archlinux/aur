# Maintainer: Wyatt J. Brown <sushidudeteam@gmail.com>
pkgname=fontconfig-enhanced-defaults
pkgver=20160428
pkgrel=1
pkgdesc='Enhanced default settings for Fontconfig and FreeType.'
arch=('any')
url='https://aur.archlinux.org/packages/fontconfig-enhanced-defaults/'
license=('custom:Public Domain')
depends=('fontconfig' 'freetype2')
install=install
source=(10-enhanced-defaults.conf 10_fontconfig-enhanced-defaults.gschema.override LICENSE fontconfig-enhanced-defaults.sh install)
sha512sums=('93de817788d243f3ca278bbf19b56a431ca9ee622933c715fd73e32d8401c4d2d195b21b5615f8796bb95c985ddb415821cc0973c18cd31c5e0c445d94b89dc6'
            'e552541f48e79f37939c016bdcccbf7a9ad48c8e44d258e7770f92f3711e7f7a467044074ff7662ca36662fe9af17954d785dd53d4c0238d8dba636576da01b8'
            '57f083acfdb3b05be097f27d8df8afb77820c61ca138f097f22564d3e10dd0b713aaf02e421d6ab8223b6fb462ad16833ce08a0f10ed17a0d3a82f34b9494df0'
            '3adb17e2448be560dac7be226cc1f5783d1dd383e35858549cc351341be86829ea8b79c3c933620be841157c38dfc44a84ec272ce9b1be734cdcaace1f1eac68'
            '00ff574abbed919c7a4534df05eb9b6f1f6df33899d39e54df1999e9e3857d09b14e430a8448884874e59be2b2ce2a7054a401fb00e9f33314faba184e4dacf8')

package()
{
	cd "$srcdir"

	install -Dm644 10-enhanced-defaults.conf "$pkgdir/etc/fonts/conf.avail/10-enhanced-defaults.conf"

	install -Dm644 10_fontconfig-enhanced-defaults.gschema.override "$pkgdir/usr/share/glib-2.0/schemas/10_fontconfig-enhanced-defaults.gschema.override"

	install -d "$pkgdir/etc/fonts/conf.d/"
	ln -s '../conf.avail/10-enhanced-defaults.conf' "$pkgdir/etc/fonts/conf.d/10-enhanced-defaults.conf"

	install -Dm755 fontconfig-enhanced-defaults.sh "$pkgdir/etc/profile.d/fontconfig-enhanced-defaults.sh"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
