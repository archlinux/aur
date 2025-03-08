# Maintainer: dringsim <dringsim@qq.com>

_pkgname=kanchenjunga
pkgname=ttf-sil-$_pkgname
_fname=${_pkgname^}
pkgver=2.001
pkgrel=1
pkgdesc='Unicode font for the Kirat Rai script'
arch=(any)
url="https://software.sil.org/$_pkgname"
license=(OFL)
_archive="$_fname-$pkgver"
source=("http://software.sil.org/downloads/r/$_pkgname/$_archive.zip")
sha256sums=('8bfcace22218e6527a0dc19a74b61caf6b4332ff06cf69df97c9f130c4aae9eb')

package() {
	cd "$_archive"
	find -type f -name "$_fname*.ttf" -execdir \
		install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" {} \;
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt FONTLOG.txt documentation/pdf/*.pdf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" OFL.txt
}

