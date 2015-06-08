# Contributor: Adam Hani Schakaki <krzd@krzd.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=j
pkgver=0.23.0
pkgrel=2
pkgdesc="A text editor written in Java"
arch=('any')
url="http://armedbear-j.sourceforge.net/"
license=('GPL')
depends=('java-runtime')
source=(http://downloads.sourceforge.net/armedbear-$pkgname/$pkgname-$pkgver-bin.tar.gz \
  $pkgname.sh)
md5sums=('a62293bae068e85acbec3ff18f7a13e9'
         '935cb24add285bab83f71011aadf93fd')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  # install jar file
  install -Dm644 $pkgname.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  # install other stuff
  install -m755 -d "$pkgdir"/usr/share/{doc/$pkgname,$pkgname/examples,$pkgname/themes}
  install -m644 doc/* "$pkgdir"/usr/share/doc/$pkgname
  install -m644 examples/* "$pkgdir"/usr/share/$pkgname/examples/
  install -m644 themes/* "$pkgdir"/usr/share/$pkgname/themes/
  # install launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
