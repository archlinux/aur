# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.112
pkgrel=1
pkgdesc="Classical Arabic typeface in Naskh style poineered by Amiria/Bulaq Press in Cairo"
arch=('any')
url="http://www.amirifont.org/"
license=('custom:OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('b9da1916f5e1028ea5d8404f7ac7b3722576d794b1053b6be11f1a02651ddf3c')
package() {
  cd "$srcdir/Amiri-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"

  # licences
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 *.pdf {NEWS,README}{,-Arabic} "$pkgdir/usr/share/doc/$pkgname/"
}
