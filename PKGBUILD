# Maintainer: Alessio 'Bl@ster' Biancalana <dottorblaster@archlinux.us>
pkgname=colorized-logs
pkgver=2.6
pkgrel=1
pkgdesc="Tools for logs with ANSI color"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/kilobyte/colorized-logs"
license=('GPL')
groups=()
depends=()
makedepends=('cmake' 'gcc')
conflicts=('python-ansi2html')
source=("https://github.com/kilobyte/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d209d9fb45f5332ba4792624746f2bbbbcf425e6539fa69657e9602e2bee6570')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
