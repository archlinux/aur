# Maintainer: ByteDream
pkgname=crunchyroll-go
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ByteDream/crunchyroll-go"
license=('LGPL3')

pkgver=1.1.0
pkgrel=1

optdepends=(
  'ffmpeg: convert output files'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ByteDream/crunchyroll-go/archive/v${pkgver}.tar.gz")
sha256sums=('a9c79e83f2899761e201d96c9c103e860e649788db6013243e36d11dbc7c7b64')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
