# Maintainer: Masterisk-F <masterisk-f [at] proton DOT me>
pkgname=ctdb-cli
pkgver=2.2.6_0.4.0
pkgrel=1
pkgdesc="A cli frontend for CUETools that verifies and repairs audio CDs using CTDB (CUETools Database)"
arch=('x86_64')
url="https://github.com/Masterisk-F/ctdb-cli"
license=(GPL-3.0-only)
depends=('dotnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/Masterisk-F/ctdb-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d54d20c198c31490b81219e588ea97d79a3cf7db3e881bb86a4dd4d314a32bea')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
