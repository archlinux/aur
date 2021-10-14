# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paccat
pkgver=0.1.0
pkgrel=1
pkgdesc='Print pacman package files'
url='https://github.com/morganamilo/paccat'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/paccat/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('pacman')
sha256sums=('9fcef179ec64ac5ddfcd186f3aacd5ce34b12c16a58eed68b54ba6955ca50240')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/paccat -t "${pkgdir}/usr/bin/"
}
