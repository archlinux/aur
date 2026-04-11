# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=garamontio
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.107
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
sha256sums=('2fcd11e716908acdcea344ece0b97a506fbd1ffc3742b76b6a2f17cc0c12fa07'
            'fbc644833aef9a803b82fae5066ea8ab046538cf69c0be7663ff1c3259fd3fd6'
            '74fb5a6f69ced818a492f46e33f55bb923ae53b5dcaa1a159893d67235f17a37'
            'd310e3ef52bd16f5476de736114a975497f94026d36c977d3d1a6b3e3c97c7b9')

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
