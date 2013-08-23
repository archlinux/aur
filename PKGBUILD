# Contributor: Baptiste Grenier <baptiste@bapt.name>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=ttf-andika
pkgver=1.004
pkgrel=1
pkgdesc='A sans serif, Unicode-compliant font designed especially for literacy use'
url='http://scripts.sil.org/andika'
arch=('any')
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-sil-fonts')
install=ttf-andika.install
source=("andika-$pkgver.zip::http://scripts.sil.org/cms/scripts/render_download.php?&format=file&media_id=Andika-$pkgver.zip&filename=Andika-$pkgver.zip")
md5sums=('f83086975b0fe292dba1749e638ba9f2')

package() {
	cd "$srcdir/Andika-$pkgver"
	install -Dm644 Andika-R.ttf "$pkgdir/usr/share/fonts/TTF/AndikaRegular.ttf"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.txt "$pkgdir/usr/share/andika/README"
	install -m644 FONTLOG.txt "$pkgdir/usr/share/andika/FONTLOG"
	install -m644 documentation/Andika-features.pdf "$pkgdir/usr/share/andika/Andika-features.pdf"
}
