# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.111
pkgrel=1
pkgdesc="A classical Arabic typeface in Naskh style poineered by Amiria Press"
arch=('any')
url="http://www.amirifont.org/"
license=('custom:OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('1fbfccced6348b5db2c1c21d5b319cd488e14d055702fa817a0f6cb83d882166')
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
