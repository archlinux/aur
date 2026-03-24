# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=garamontio
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.098
pkgrel=1
pkgdesc='a fork of EB Garamond'
arch=(any)
url="https://m-casanova.codeberg.page/${_name^}/"
_url="https://codeberg.org/m-casanova/${_name^}"
license=(OFL)
_archive="${_name^}-$pkgver"
source=("$_archive-otf.zip::$_url/releases/download/v$pkgver/${_name}_otf.zip"
        "$_archive-ttf.zip::$_url/releases/download/v$pkgver/${_name}_ttf.zip"
        "$_archive-var.zip::$_url/releases/download/v$pkgver/${_name}_var.zip"
        "$_archive.tar.gz::$_url/archive/v$pkgver.tar.gz")
sha256sums=('c51c8cb9c4c04c91bdcabc300ebb2003bb1884439d7785ee92a71dec3bdca00d'
            '8979ba3fb081868d661ea4a357783c0567738765dcf2ee3181e7e095db97d8fc'
            '7125cbbd68c1ccc506ca151567512e09f668f28e8a1f78e062f383a642e4cb34'
            '3d8c7cd7f3344e24f13a52dc9ce71554a6986564622d9b5c362e82d8b7ba0d7e')

package_otf-garamontio() {
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" ${_name^}-*.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name/OFL.txt
}

package_ttf-garamontio() {
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" ${_name^}-*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name/OFL.txt
}

package_ttf-garamontio-variable() {
	provides=("$pkgbase")
	install -Dm644 -t "$pkgdir/usr/share/fonts/VAR/" ${_name}*.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" $_name/OFL.txt
}
