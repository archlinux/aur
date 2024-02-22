# Maintainer: Andy Alt <arch_stanton5995@proton.me>

pkgname=pinner
pkgver=0.1.2
pkgrel=1
pkgdesc="A Geany plugin that enables pinning documents to a sidebar tab"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/andy5995/pinner"
license=('MIT')
depends=('geany')
makedepends=('meson' 'ninja')
source=("https://github.com/andy5995/pinner/releases/download/v$pkgver/pinner-$pkgver.tar.xz")
sha256sums=('be079c92a7bec8c335bd3deccfc3db4eafd314a89ea3ac48bcf814c2a3072f1b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup builddir --prefix=/usr --buildtype=release
  ninja -v -C builddir
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C builddir install
}
