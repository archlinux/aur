# Maintainer: LazySeldi <197385604+LazySeldi@users.noreply.github.com>
pkgname=lazydmi
pkgver=v3.0.0
pkgrel=1
pkgdesc="CLI tool that uses lazybios for reading SMBIOS/DMI tables easily"
arch=('x86_64' 'aarch64')
url="https://github.com/LazySeldi/lazydmi"
license=('LGPL-2.1-or-later')
depends=('lib-lazybios')
makedepends=('gcc' 'make')
source=("https://github.com/LazySeldi/lazydmi/releases/download/$pkgver/lazydmi-$pkgver.tar.gz")
sha256sums=('59b2bc64f25cbafe79d9527107c7935916661e6c9a54215a1f58635263ab0f16')

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
