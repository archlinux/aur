# Maintainer: Chair <sergeyponomorev0@gmail.com>
pkgname=hashreaper
pkgver=3.52
pkgrel=1
pkgdesc="Fast hash cracker with network distribution, Russian charsets, and cross-platform"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/yourusername/hashreaper"
license=('GPL3')
depends=('openssl')
makedepends=('gcc' 'make')
optdepends=('nmap: faster network scan' 'traceroute: automatic network detection')
source=("https://github.com/yourusername/hashreaper/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX="/usr"
}