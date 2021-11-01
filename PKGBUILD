# Maintainer: ByteDream
pkgname=crunchyroll-go
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ByteDream/crunchyroll-go"
license=('LGPL3')

pkgver=1.2.2
pkgrel=1

optdepends=(
  'ffmpeg: convert output files'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/crunchyroll-go/archive/v${pkgver}.tar.gz")
sha256sums=('f8c1559ae003f6775eac31b0e035f0b7b669095970e869b15406c6a19460ca84')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  # cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
