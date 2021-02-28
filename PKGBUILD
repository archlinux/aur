# Maintainer: maximumadmin <mxmadm@protonmail.com>

pkgname=zramd
pkgver=0.8.4
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
sha256sums=('878fc14edf772eff956a8953d732e2d99a1a2845799b0a1a0a550da763bf7252')

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
