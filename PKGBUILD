# Maintainer: Munzir Taha <munzirtaha at gmail.com>
# Contributor: Wyegu <bsdazs17 at gmail dot com>
# Contributor: Firmicus <firmicus at gmx dot net>

pkgname=ttf-sil-scheherazade
pkgver=2.020
pkgrel=2
pkgdesc="OpenType Arabic font from SIL"
arch=('any')
url="http://scripts.sil.org/ArabicFonts"
license=('custom:OFL')
install=$pkgname.install
source=('http://scripts.sil.org/cms/scripts/render_download.php?format=file&media_id=Scheherazade-2.020.zip&filename=Scheherazade-2.020.zip')
sha256sums=('d8bb12997507937347efba4e59550a9655350563d1df662f0651e04ba916aff1')

package() {
  # Font installation
  cd "$srcdir/Scheherazade-$pkgver"
  install -d ${pkgdir}/usr/share/fonts/TTF 
  install -m 644 Scheherazade-R.ttf ${pkgdir}/usr/share/fonts/TTF/scheherazade.ttf

  # license
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 OFL.txt OFL-FAQ.txt ${pkgdir}/usr/share/licenses/${pkgname}/

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 README.txt FONTLOG.txt documentation/Scheherazade-features.{pdf,odt} documentation/DOCUMENTATION.txt "$pkgdir/usr/share/doc/$pkgname/"

}
