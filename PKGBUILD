# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>

pkgname=pacterm
pkgver=1.3.8
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
sha256sums=('8a93a5dadcfb081a927932647ed7488368edac2680b09096aff4395bcababbd7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
