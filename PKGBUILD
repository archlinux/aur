# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgbase=sv_dvorak
pkgname=(sv_dvorak-xorg sv_dvorak-console)
pkgver=1
pkgrel=3

url="http://tlundqvist.org/sv_dvorak/"
arch=('any')
license=('GPL')

source=('http://tlundqvist.org/sv_dvorak/drivers/se_sv_dvorak_new.xorg'
        'http://tlundqvist.org/sv_dvorak/drivers/dvorak-se.map')

md5sums=('1e4a2818c89e60001a1ec2d98911a0a0'
         '722e35f7fcbe5e066e51d2971ab21745')

package_sv_dvorak-xorg() {
	pkgdesc="A Swedish dvorak keyboard layout"
	depends=('xorg-server')
	install=sv_dvorak.install

	install -Dm644 se_sv_dvorak_new.xorg "$pkgdir"/usr/share/X11/xkb/symbols/se_sv_dvorak
}

package_sv_dvorak-console() {
	pkgdesc="A Swedish dvorak keyboard layout"

	gzip -f dvorak-se.map
	mkdir -p "$pkgdir"/usr/share/kbd/keymaps/i386/dvorak/
	install -Dm644 dvorak-se.map.gz "$pkgdir"/usr/share/kbd/keymaps/i386/dvorak/
}
