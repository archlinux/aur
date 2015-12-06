# Maintainer: gustawho < gustawho [at] gmail [dot] com
#

pkgname=backupd
pkgdesc="Compressed and encrypted backups with 7zip and GPG"
pkgver=0.1
pkgrel=2
arch=('any')
url="https://github.com/gustawho/backupd"
license=("GPL3")
makedepends=('git')
depends=('p7zip')
source=("http://gustawho.x10.mx/packages/${pkgname}-${pkgver}.tar.gz")
sha512sums=('7c7be8b9f180db252e9d8a3ffa27d2685cd6c590dd3d33b236c0a1d3720a675ffba01b7822a2c01f1b560c01c845d268c8a0e462879f94db3c88a48a25a1a55b')

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
