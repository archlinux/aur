# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Roman Timushev <rtimuh@gmail.com>
# Maintainer: vauvenal5 <vauvenal5@gmail.com>

pkgname=lilith
pkgver=0.9.44
pkgrel=2
pkgdesc="logging and access event viewer for Logback, log4j and JUL"
arch=(any)
url="http://lilith.huxhorn.de/"
license=('GPL')
makedepends=(gendesk)
depends=(java-runtime)
validpgpkeys=('3CECE46C577B8BFE85B657256334E557740A1840')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-bin.tgz"
    "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-bin.tgz.asc")
md5sums=('678903bffc0ab5b2c8c4b139fd1621b2'
         'SKIP')

prepare() {
	gendesk
}

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/opt"
  install -dm755 "$pkgdir/usr/bin"
  cp -R "$pkgname-$pkgver" "$pkgdir/opt"
  ln -s "/opt/$pkgname-$pkgver/bin/lilith" "$pkgdir/usr/bin/lilith"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
