# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=garamontio
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.302
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
sha256sums=('d0f5fd9c512fee31c428e3bd602f789977decfe5e53bfc3d53adb9dd302021ca'
            '73372b7df5e5cd80885db14c9b1f71738e009e03371dcb722dce55d5fcdee017'
            'fb6bbefac0a5b3bd4b53bf6f0736a96c67596f789157bd18edb2db3f29355ae6'
            '577963acb5d037480e5af9168091cdea78b1f6973b670d429070f571a318f772')

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
