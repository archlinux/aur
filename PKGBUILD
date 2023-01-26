# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=frzr
pkgver=0.11.5
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
url="https://github.com/gamer-os/frzr"
license=('MIT')
depends=('btrfs-progs' 'syslinux' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gamer-os/frzr/archive/$pkgver.tar.gz")
md5sums=('31ab08bb357aa5d9c12100075fcc165d')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-release" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-unlock" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.timer" "$pkgdir/etc/systemd/system"
}
