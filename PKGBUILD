# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.107
pkgrel=2
pkgdesc="A classical Arabic typeface in Naskh style poineered by Amiria Press"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL')
install=font.install
source=(http://downloads.sourceforge.net/project/amiri/amiri-$pkgver.zip)
sha256sums=('7e81fa2844ded0d7839dc8eedcc4f7ece3688b9cd9ac9b3fd806340cdcef5463')

package() {
  cd "$srcdir/amiri-$pkgver"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"

  # licences
  cd "$srcdir/amiri-$pkgver"
  install -D -m644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
  install -D -m644 OFL-FAQ.txt "${pkgdir}/usr/share/licenses/${pkgname}/OFL-FAQ.txt"

  # docs
  install -d $pkgdir/usr/share/doc/$pkgname
  cd "$srcdir/amiri-$pkgver/documentation"
  install -m644 *.{pdf,txt} "$pkgdir/usr/share/doc/$pkgname/"
}
