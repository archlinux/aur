# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>

pkgname=pacterm
pkgver=1.3.9
pkgrel=1
pkgdesc="A terminal-based Pac-Man game written in C++23"
arch=('x86_64' 'aarch64')
url="https://github.com/Wael-MA/pacterm"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('gcc' 'make')
provides=('pacterm')
conflicts=('pacterm-bin' 'pacterm-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('613e0615545f6f5773ff43e18f9068aced493a935dd92d81d2713496f9dcaad7')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
