# Maintainer: Andy Alt <arch_stanton5995@proton.me>

pkgname=pinner
pkgver=0.1.1
pkgrel=1
pkgdesc="A Geany plugin that enables pinning documents to a sidebar tab"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/andy5995/pinner"
license=('MIT')
depends=('geany')
makedepends=('meson' 'ninja')
source=("https://github.com/andy5995/pinner/releases/download/v$pkgver/pinner-$pkgver.tar.xz")
sha256sums=('591f3cba61cdc96747bf8a6f134f9b977567e6c28583ef2fa61d5433498ff54b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup builddir --prefix=/usr --buildtype=release
  ninja -v -C builddir
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C builddir install
}
