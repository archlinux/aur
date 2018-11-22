# Maintainer: Roey Darwish Dror <roey.ghost@gmail.com>

pkgname=alma
pkgver=0.3.0
pkgrel=1
pkgdesc='Create Arch Linux based live USB'
arch=('x86_64')
url='https://github.com/r-darwish/alma'
license=('GPL3')
makedepends=('rust')
depends=('gptfdisk' 'parted' 'arch-install-scripts' 'dosfstools' 'btrfs-progs' 'coreutils' 'util-linux')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('488d7f0c24f7a79fdc03af461d5f65ce14d4013ab22b0f7bd43755ab73f500f4')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
