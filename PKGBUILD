# Maintainer: Your Name <you@example.com>
pkgname=libfile
pkgver=1.0.2
pkgrel=2
pkgdesc="File library for checking types and architecture. "
arch=('x86_64')
url="https://github.com/coolguy-09/libfile"
license=('MIT')
depends=()
makedepends=('gcc' 'make' 'binutils')
source=("https://github.com/coolguy-09/libfile/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP') # Replace with actual checksum if using tarball

build() {
  cd "$srcdir/$pkgname-$pkgver"
  chmod +x configure
  ./configure ARCH=arch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-arch
}
