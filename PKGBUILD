# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('LGPL2.1')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi$pkgver.tar.gz")
sha256sums=('49026f4b31cd7759b914bb322c881fadbd9e38ec4ed2854444e09f2a433175a0')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
