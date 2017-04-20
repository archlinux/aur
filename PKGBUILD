# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=bournal
pkgver=1.5
pkgrel=3
pkgdesc="bash script that allows you to write, search and edit encrypted journal entrie"
arch=('i686' 'x86_64')
url="http://becauseinter.net/bournal/"
depends=('gnupg' 'bash')
license=('gpl')
source=("https://github.com/jose1711/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('95152bd789212f0d1431a25fc7085f7f')
install='bournal.install'

package() {
cd $srcdir/$pkgname-$pkgver
mkdir -p ${pkgdir}/usr/share/icons/hicolor
install -Dm755 bournal $pkgdir/usr/bin/bournal
install -Dm755 bournal-convert $pkgdir/usr/bin/bournal-convert
install -Dm644 bournal.1.gz $pkgdir/usr/share/man/man1/bournal.1.gz
install -Dm644 bournal.desktop $pkgdir/usr/share/applications/bournal.desktop
cp -r icons/* ${pkgdir}/usr/share/icons/hicolor
}
