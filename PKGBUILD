# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=1.0.0
pkgrel=2
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('LGPL2.1')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi$pkgver.tar.gz")
sha256sums=('9ed7f2821b763f5d2563c775332cd3b3054cf5978399311510e481a5c9de193b')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
