# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=2.0.0
pkgrel=1
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('LGPL-2.1-or-later')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi-$pkgver.tar.gz")
sha256sums=('e7b339338943811a5e85abaf88e92e00aa623024a744ab532aac5aed29f7dc71')

build() {
  make -C "$srcdir/lazydmi-$pkgver" \
    PREFIX=/usr
}

package() {
  make -C "$srcdir/lazydmi-$pkgver" \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    install
}
