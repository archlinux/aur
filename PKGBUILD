# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>

pkgname=pacterm
pkgver=1.3.7
pkgrel=1
pkgdesc="A terminal-based Pac-Man game written in C++20"
arch=('x86_64' 'aarch64')
url="https://github.com/wa-el-az/pacterm"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc' 'make')
provides=('pacterm')
conflicts=('pacterm-bin' 'pacterm-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd96b0cde73679462869ac22c14439c4ee837771767c597558a810bcee29b982')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
