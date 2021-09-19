# Maintainer: SoftwareRat <jaguar5018@gmail.com>

pkgname=otf-pricedown
pkgver=1.0
pkgrel=1
pkgdesc="Pricedown font from http://www.dafont.com"
arch=(any)
url="https://www.dafont.com/de/pricedown.font"
license=('custom')
source=("$pkgname.zip::http://dl.dafont.com/dl/?f=pricedown")
noextract=("$pkgname.zip")
sha1sums=('592d1e7693fb30d9fa21c9f3b03c488000fecdb3')

prepare() {
  unzip -o -j -LL -qq $pkgname.zip -d $srcdir/$pkgname/
}

package() {
  
  # Installing font
  chmod 644 "$srcdir/$pkgname/"*.otf
  install -dm755 "$pkgdir/usr/share/fonts/OTF"
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname/"*.otf "$pkgdir/usr/share/fonts/OTF/"

  # License
  cd $srcdir
  install -Dm644 "$srcdir/$pkgname/"typodermic-eula-03-2020.pdf \
    "$pkgdir/usr/share/licenses/$pkgname/typodermic-eula-03-2020.pdf"
}
