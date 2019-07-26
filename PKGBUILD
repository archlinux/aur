# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=frzr
pkgver=0.1.1
pkgrel=2
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('i686' 'x86_64')
url="https://github.com/gamer-os/frzr"
license=('MIT')
depends=('btrfs-progs' 'syslinux' 'parted')
source=("https://github.com/gamer-os/frzr/archive/$pkgver.tar.gz")
md5sums=('9201446c45de7c3393ef02e1ec88278a')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-release" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-etc.service" "$pkgdir/etc/systemd/system"
}
