# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.110
pkgrel=1
pkgdesc="A classical Arabic typeface in Naskh style poineered by Amiria Press"
arch=('any')
url="http://www.amirifont.org/"
license=('custom:OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('963a569449f698ff9e6d5da88bf87f8319a1bcb7a1313da72b19a7c242161ce9')
package() {
  cd "$srcdir/amiri-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"

  # licences
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 *.pdf {NEWS,README}{,-Arabic} "$pkgdir/usr/share/doc/$pkgname/"
}
