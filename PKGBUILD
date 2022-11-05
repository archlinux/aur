# Maintainer: weilinfox <weilinfox at inuyasha dot love>

pkgname=th10
pkgver=0.02
pkgrel=2
pkgdesc='Mountain of Faith trial version. Tenth game of the Touhou Project series.'
arch=(x86_64)
url='https://www16.big.or.jp/~zun/html/th10top.html'
license=('custom')
depends=('wine')
makedepends=('lha')
source=('http://kokoron.madoka.org/mirror/D/t/touhoufuujinroku/th10tr002a_setup.exe'
        'http://www16.big.or.jp/~zun/data/soft/thcustom_002a.lzh'
	'th10.sh'
	'th10-custom.sh'
	'th10.xpm'
	'th10.desktop')
md5sums=('4c816e8d7f59430d5083e55c86df2462'
	 'ff0501145d6dc00e61fd8bd153e3bc5a'
	 '027fe63b2c9d28abbff74064a38fe2bb'
	 '36254f0ca77fb9fe709cbbe2191afa98'
	 '7e337e7d4e04feb0d7af3d7480e8d4b4'
	 '729af1ecd46aa43c52f3465fa8a62fb7')

prepare() {
	cd "$srcdir"
	LC_ALL=C lha xf thcustom_002a.lzh
}

package() {
	cd "$srcdir"
	install -d -m755 "$pkgdir/usr/share/$pkgname"
	install -m755 th10tr002a_setup.exe "$pkgdir/usr/share/$pkgname"
	install -m755 custom.exe "$pkgdir/usr/share/$pkgname"

	install -d -m755 "$pkgdir/usr/bin/"
	install -m755 th10.sh "$pkgdir/usr/bin/th10"
	install -m755 th10-custom.sh "$pkgdir/usr/bin/th10-custom"

	install -d -m755 "$pkgdir/usr/share/pixmaps"
	install -m644 th10.xpm "$pkgdir/usr/share/pixmaps"
	install -d -m755 "$pkgdir/usr/share/applications"
	install -m755 th10.desktop "$pkgdir/usr/share/applications"
}

