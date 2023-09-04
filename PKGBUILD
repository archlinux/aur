# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Timofey Titovets <Nefelim4ag@gmail.com>

pkgname=systemd-swap
pkgver=4.4.0
pkgrel=2
pkgdesc="Script for creating hybrid swap space from zram swaps, swap files and swap partitions."
arch=('any')
url="https://github.com/Nefelim4ag/systemd-swap"
license=('GPL3')
depends=('python-systemd' 'python-sysv_ipc' 'systemd' 'util-linux')
backup=('etc/systemd/swap.conf')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Nefelim4ag/systemd-swap/archive/$pkgver.tar.gz")
sha512sums=('39cf297d0d82f4d5fbae64f323bda2c286dd24665321892f068dc5bceea4ea5ddcacdcef14576cab869edbed7d258de759baec36535403051bb2b925406db0b3')

build() {
  cd systemd-swap-$pkgver
  make
}

check() {
  cd systemd-swap-$pkgver
  ./systemd-swap status
}

package() {
  cd systemd-swap-$pkgver
  make DESTDIR="$pkgdir" install
}
