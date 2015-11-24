# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Roman Timushev <rtimuh@gmail.com>
# Maintainer: vauvenal5 <vauvenal5@gmail.com>

pkgname=lilith
pkgver=8.0.0
pkgrel=2
pkgdesc="logging and access event viewer for Logback, log4j and JUL"
arch=(any)
url="http://lilith.huxhorn.de/"
license=('GPL')
makedepends=(gendesk)
depends=(java-runtime)
validpgpkeys=('3CECE46C577B8BFE85B657256334E557740A1840')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-bin.tgz"
    "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-bin.tgz.asc"
    "http://sourceforge.net/p/lilith/code/ci/master/tree/icon.png?format=raw")
md5sums=('c46c436e384dac332d5ff65597524327'
         '4a22977037c06f58adf58aaa6c32564e'
         'd835b5c67d2ba277fa2c359ddae7d28f')

prepare() {
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt"
  install -dm755 "$pkgdir/usr/bin"
  cp -R "$pkgname-$pkgver" "$pkgdir/opt"
  ln -s "/opt/$pkgname-$pkgver/bin/lilith" "$pkgdir/usr/bin/lilith"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "icon.png?format=raw" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
