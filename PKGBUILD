# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bournal
pkgver=1.5
pkgrel=1
pkgdesc="bash script that allows you to write, search and edit encrypted journal entrie"
arch=('i686' 'x86_64')
url="http://becauseinter.net/bournal/"
depends=('gnupg' 'bash')
license=('gpl')
source=("http://becauseinter.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('465efa201af345c3bb3acdb47b1f7c67')

build() {
true
}

package() {
cd $srcdir/$pkgname-$pkgver
install -Dm755 bournal $pkgdir/usr/bin/bournal
install -Dm755 bournal-convert $pkgdir/usr/bin/bournal-convert
install -Dm644 bournal.1.gz $pkgdir/usr/share/man/man1/bournal.1.gz
mkdir -p $pkgdir/usr/share/icons/hicolor
install -Dm644 icons/* $pkgdir/usr/share/icons/hicolor || true
install -Dm644 bournal.desktop $pkgdir/usr/share/applications/bournal.desktop
}
