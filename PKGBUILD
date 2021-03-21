# Maintainer: maximumadmin <mxmadm@protonmail.com>

pkgname=zramd
pkgver=0.8.6
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
source=("https://github.com/maximumadmin/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('67b1f138e2b254e83e3ae5a43f93a8bb2fb1cf1bb4a4cff18a6609b5c565d0ae')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  PREFIX="$pkgdir" make install
}
