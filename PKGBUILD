# Maintainer: ByteDream
pkgname=crunchyroll-go
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ByteDream/crunchyroll-go"
license=('LGPL3')

pkgver=2.0.2
pkgrel=1

optdepends=(
  'ffmpeg: convert output files'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/crunchyroll-go/archive/v${pkgver}.tar.gz")
sha256sums=('81a881f912d1ec907f46a1278f8d8d4f1bace243522764a4922d8f37e7f26b6f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
