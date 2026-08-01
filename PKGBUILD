pkgname=asleap-bin
pkgver=2.3
pkgrel=1
pkgdesc='Actively recover LEAP/PPTP passwords.'
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
url='https://github.com/Obsidian-Covenant/asleap'
depends=('libpcap')
source=("https://github.com/Obsidian-Covenant/asleap/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('4cfe094c706397704da8811614d841975f1ce9217704aeb19f961793dd09a0960ea769345c92e27017791ec9bcbf93b8655fb0bfede521c25841e7e1f76c1c56')

build() {
  cd "$srcdir/asleap-$pkgver"
  make
}

package() {
  cd "$srcdir/asleap-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin/" asleap genkeys
}
