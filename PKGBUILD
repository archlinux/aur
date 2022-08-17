# Maintainer: Jason Moore <jason at jasonmoore dot xyz>
pkgname=cpuwatch
pkgver=0.1
pkgrel=1
pkgdesc="A program to report CPU usage"
arch=("x86_64")
url="https://github.com/jasonmxyz/cpuwatch"
license=("MIT")
depends=(glibc)
makedepends=(coreutils gcc gzip make)
source=("$pkgname.tar.gz::https://github.com/jasonmxyz/cpuwatch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f43098e0596bd42312b26dd7fd9bcd7d96a25a8021a179667d2797d6bc2812f6")

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  make install binprefix="$pkgdir/usr/bin"
  make install-man manprefix="$pkgdir/usr/share/man"
}
