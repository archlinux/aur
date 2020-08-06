# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Variable fonts based on the Commodore 64 and Amiga fonts'
pkgbase=homecomputer-fonts
pkgname=(ttf-homecomputer-workbench ttf-homecomputer-sixtyfour)
pkgver=1.0
pkgrel=1
url=https://github.com/jenskutilek/homecomputer-fonts
license=(custom:OFL)
arch=(any)
source=("$pkgbase-$pkgver.zip::$url/releases/download/v$pkgver/$pkgbase.zip"
        "$pkgbase-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE.txt")
sha512sums=('a125e4b59b2d086ba9a668a1a384f806fa647f55ab91d6a5c57e6dd59278fb66e3fbf822a908da111b6f28d0dbe273bd6c68581f38b54b0d62cf03f8c7e5231e'
            '59298e77c1c21693de9118c21bfa5d45c26d16e238a61753c3c95503b354b586938989a712590e3a6c10c34caab3645abd416ec9c8341b5f98d8eb3c1249a1c0')

_install_license ()
{
	install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 -T "$pkgbase-$pkgver-LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-homecomputer-workbench () {
	pkgdesc='Variable font based on the Amiga system font'
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" \
		"$pkgbase/Workbench[wdth,wght].ttf"
	_install_license
}

package_ttf-homecomputer-sixtyfour () {
	pkgdesc='Variable font based on the Commodore 64 system font'
	install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" \
		"$pkgbase/Sixtyfour[wdth,wght].ttf"
	_install_license
}
