# Maintainer: ByteDream
pkgname=crunchyroll-go
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ByteDream/crunchyroll-go"
license=('LGPL3')

pkgver=1.2.4
pkgrel=1

optdepends=(
  'ffmpeg: convert output files'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/crunchyroll-go/archive/v${pkgver}.tar.gz")
sha256sums=('bda6d9c9112e4083e130155e0d17d85b0f3dafcde84a99722b11fd29b1da10e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
