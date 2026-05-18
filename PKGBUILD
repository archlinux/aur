# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=garamontio
pkgbase=$_name-font
pkgname=(otf-$_name ttf-$_name ttf-$_name-variable)
pkgver=1.208
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
sha256sums=('411351c65d4cce31fb31012e381c133645c66325899f3316567d4f03ea64fc31'
            '8a295bc2aab183d87046d943552d6d127394361c4895e7c067879204c558f753'
            '1e58d9e2bad46cf965d15a9090f8680ffac01c7cf5abc60c34f16564dc2d81b1'
            'db42cba7fd2814f0958e43e94aa1ce85cc57975cf82d453e15dd1b55865c8148')

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
