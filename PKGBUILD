# Maintainer: Masterisk-F <masterisk-f [at] proton DOT me>
pkgname=ctdb-cli
pkgver=2.2.6_0.5.0
pkgrel=1
pkgdesc="A cli frontend for CUETools that verifies and repairs audio CDs using CTDB (CUETools Database)"
arch=('x86_64')
url="https://github.com/Masterisk-F/ctdb-cli"
license=(GPL-3.0-only)
depends=('dotnet-runtime-10.0')
makedepends=('dotnet-sdk-10.0' 'git')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/Masterisk-F/ctdb-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a0775391f9c8eaf25ee89bba4e36206b7491e8a417d0673d6f759cf72952afbc')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
