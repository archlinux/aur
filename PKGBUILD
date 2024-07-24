# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=frzr
pkgver=0.15.2
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
url="https://github.com/gamer-os/frzr"
license=('MIT')
depends=('btrfs-progs' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gamer-os/frzr/archive/$pkgver.tar.gz")
md5sums=('b4a5bb450c2b32d37742d598c20b12f0')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-envars" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-unlock" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-version" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-bootloader" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-kernel" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/__frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-bootloader" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-kernel" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-source" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-unlock" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-extras" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-release" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/frzr-$pkgver/frzr-version" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
  install -m 644 "$srcdir/frzr-$pkgver/frzr-autoupdate.timer" "$pkgdir/etc/systemd/system"
}
