# Maintainer: Alessio 'Bl@ster' Biancalana <alessio@dottorblaster.it>
pkgname=colorized-logs
pkgver=2.7
pkgrel=1
pkgdesc="Tools for logs with ANSI color"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/kilobyte/colorized-logs"
license=('MIT')
groups=()
depends=()
makedepends=('cmake' 'gcc')
conflicts=('python-ansi2html')
source=("https://github.com/kilobyte/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fb97c9c90efd739f03dabd8cf5825c2afc95d1f1e0d6cacf62d53a8c540b3df')

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
