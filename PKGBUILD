# Maintainer: gustawho < gustawho [at] gmail [dot] com
#

pkgname=backupd
pkgdesc="Compressed and encrypted backups with xz and GPG"
pkgver=0.2
pkgrel=1
arch=('any')
url="https://github.com/gustawho/backupd"
license=("GPL3")
depends=('pigz')
optdepends=('davfs2: WebDAV support')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c7ad3ef074ef0fcb22f1d63ff2bedbf02e61aa15d1ab7c8f698279cbc5a929e61dee799fea15b6ee90963fc389206b41fa120d2039b9ddf318f86ef3e93ae2cb')

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
