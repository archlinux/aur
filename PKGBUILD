# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=padauk
pkgname=ttf-sil-$_pkgname
pkgver=5.100
pkgrel=2
pkgdesc='Unicode font that supports the many diverse languages that use the Myanmar script'
url="https://software.sil.org/$_pkgname"
arch=(any)
license=(OFL-1.1-RFN)
conflicts=('ttf-sil-fonts<=6')
_archive="${_pkgname^}-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('e3f9484ad6d240c5b622a1253cadc0392afdeaf9bb8b0ec8af6aeed9543b26ef')

package() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ${_pkgname^}-*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/*.pdf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}
