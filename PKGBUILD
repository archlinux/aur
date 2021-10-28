# Maintainer: Eric Toombs
pkgname=mech
pkgver=1.36.3
pkgrel=1
pkgdesc="An anonymous automated instagram, reddit, soundcloud, vimeo, and youtube downloader."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/89z/mech"
license=('GPL3')
makedepends=(
  'git'
  'go'
)
source=("$pkgname.tar.gz::https://github.com/89z/mech/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a050a1fe936728356eaced07f5b776294bf5bf43aeb746f2898130aa577d2c81')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build
  cd build
  find ../cmd -maxdepth 1 -mindepth 1 -type d -exec go build {} \;
}

package() {
  install -D -m 755 -t "$pkgdir/usr/bin" "$srcdir/$pkgname-$pkgver"/build/*
}
