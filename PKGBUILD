# Maintainer: maximumadmin <mxmadm@protonmail.com>

pkgname=zramd
pkgver=0.8.3
pkgrel=1
pkgdesc="Automatically setup swap on zram ✨"
arch=('any')
url="https://github.com/maximumadmin/zramd"
license=('MIT')
depends=('util-linux')
makedepends=('go')
optdepends=('earlyoom: userspace oom daemon')
conflicts=('systemd-swap' 'zramswap' 'zram-generator' 'zram-generator-git')
backup=('etc/default/zramd')
source=("https://github.com/maximumadmin/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6ee094f4094ab23d45c092939f98848672c003219f843d656626adbeeef1485f')

build() {
  cd "$pkgname-$pkgver"
  make release
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  PREFIX="$pkgdir" make install
}
