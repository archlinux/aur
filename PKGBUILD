# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=systemd-swap-git
pkgver=4.4.0.r39.g6e4fd33
pkgrel=1
pkgdesc="Script for creating hybrid swap space from zram swaps, swap files and swap partitions"
arch=('any')
url="https://github.com/Nefelim4ag/systemd-swap"
license=('GPL3')
depends=('python' 'python-systemd' 'python-sysv_ipc' 'util-linux')
makedepends=('git')
provides=("systemd-swap=$pkgver")
conflicts=('systemd-swap')
backup=('etc/systemd/swap.conf')
source=("git+https://github.com/Nefelim4ag/systemd-swap.git")
sha256sums=('SKIP')


pkgver() {
  cd "systemd-swap"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "systemd-swap"

  make DESTDIR="$pkgdir" install
}
