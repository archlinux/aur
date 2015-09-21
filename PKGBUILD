# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.108
pkgrel=1
pkgdesc="A classical Arabic typeface in Naskh style poineered by Amiria Press"
arch=('any')
url="http://www.amirifont.org/"
license=('custom:OFL')
install=ttf-amiri.install
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('1b33e4106b61ca8b9743e9c2b75230c637386b331c79cb6dd2bcddf50738f8f5')
package() {
  cd "$srcdir/amiri-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"

  # licences
  cd "$srcdir/amiri-$pkgver"
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  cd "$srcdir/amiri-$pkgver"
  install -m644 *.pdf NEWS{,-Arabic} README{,-Arabic} "$pkgdir/usr/share/doc/$pkgname/"
}
