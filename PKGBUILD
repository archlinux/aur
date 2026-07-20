# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('MIT')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi$pkgver.tar.gz")
sha256sums=('25c6322b307a6a20bbdac3a126946159de4bab3aacb9652d7b34b5de3538d13e')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
