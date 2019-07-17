# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=frzr
pkgver=0.0.1
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('i686' 'x86_64')
url="https://github.com/gamer-os/frzr"
license=('MIT')
depends=('btrfs-progs' 'syslinux')
source=("https://github.com/gamer-os/frzr/archive/$pkgver.tar.gz")
md5sums=('125f2274b302f27c408aafc22b08bf73')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-deploy" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
}

