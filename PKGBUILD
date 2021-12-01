# Maintainer: ByteDream
pkgname=crunchyroll-go
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ByteDream/crunchyroll-go"
license=('LGPL3')

pkgver=1.2.3
pkgrel=1

optdepends=(
  'ffmpeg: convert output files'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/crunchyroll-go/archive/v${pkgver}.tar.gz")
sha256sums=('ab49ff3cef3c86ba366f92b74d948b62c415c182880f2ce55979cc9bdba275b5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
