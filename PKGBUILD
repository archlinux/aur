# Maintainer: gustawho < gustawho [at] gmail [dot] com
#

pkgname=backupd
pkgdesc="Compressed and encrypted backups with 7zip and GPG"
pkgver=0.1
pkgrel=2
arch=('any')
url="https://github.com/gustawho/backupd"
license=("GPL3")
depends=('p7zip')
source=("http://gustawho.x10.mx/packages/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a04bbafc4b2658727fe0d33a214471912864b682865c8115b2700bc80380e1bf04a96ab6090a160192dbd1a05292bff2776c3dcf7c2de1db6394d9ab56daa48a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/lib/systemd/user/ $pkgdir/usr/bin/ $pkgdir/usr/share/man/man1
  install -m644 backupd "$pkgdir/usr/bin/"
  install -m644 backupd-daemon "$pkgdir/usr/bin/"
  install -m644 backupd.service "$pkgdir/usr/lib/systemd/user/"
  install -m644 backupd.timer "$pkgdir/usr/lib/systemd/user/"
  install -m644 backupd.1.gz "$pkgdir/usr/share/man/man1/"
  chmod +x "$pkgdir/usr/bin/backupd"
  chmod +x "$pkgdir/usr/bin/backupd-daemon"
}
