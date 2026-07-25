# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('LGPL2.1')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi$pkgver.tar.gz")
sha256sums=('858084498783c094dde0263612502e2f10e485f3b164b2d5caab75bd449821be')

build() {
  cd "$srcdir/$pkgname$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}
