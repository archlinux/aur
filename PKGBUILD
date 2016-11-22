# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.109
pkgrel=1
pkgdesc="A classical Arabic typeface in Naskh style poineered by Amiria Press"
arch=('any')
url="http://www.amirifont.org/"
license=('custom:OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('97ee6e40d87f4b31de15d9a93bb30bf27bf308f0814f4ee9c47365b027402ad6')
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
