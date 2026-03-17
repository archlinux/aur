# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=padauk
pkgname=ttf-sil-$_pkgname
pkgver=6.000
pkgrel=1
pkgdesc='Unicode font that supports the many diverse languages that use the Myanmar script'
url="https://software.sil.org/$_pkgname"
arch=(any)
license=(OFL-1.1-RFN)
conflicts=('ttf-sil-fonts<=6')
_archive="${_pkgname^}-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('4f5fd3e50292d07467cea545cceb326506d6d4efeefcc1204375c0c2a3ebcad9')

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ${_pkgname^}-*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*.pdf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
