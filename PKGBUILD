# Maintainer: Masterisk-F <masterisk-f [at] proton DOT me>
pkgname=ctdb-cli
pkgver=2.2.6_0.3.2
pkgrel=1
pkgdesc="A cli frontend for CUETools that verifies and repairs audio CDs using CTDB (CUETools Database)"
arch=('x86_64')
url="https://github.com/Masterisk-F/ctdb-cli"
license=(GPL-3.0-only)
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/Masterisk-F/ctdb-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ae9500825662174918c473697225b85837db81203a040d46b57e8f24f891633')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
