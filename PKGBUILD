# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('MIT')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi$pkgver.tar.gz")
sha256sums=('3ff9d414f3d0505b225a8f1575d1352922dc943036576a825903d8d49f489aeb')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
