# Maintainer: jlxip <jlxip@protonmail.com>

# Package name
pkgname=ssockets

# Version
pkgver=0.1.2
pkgrel=1

# Generic
pkgdesc='A C library for scalable TCP servers'
arch=('x86_64')
url="https://github.com/jlxip/${pkgname}"
license=('GPL3')

# Dependencies
depends=('glibc')

# Package relations
provides=('libssockets.so')

# Sources
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

# Integrity
sha256sums=('521614aef5a9d8badab6e514399238a7dc6d786c40664b6f9cdc91157c39f497')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
