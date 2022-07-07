# Maintainer: ByteDream
pkgname=crunchyroll-go
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('LGPL3')

pkgver=2.2.2
pkgrel=3

optdepends=(
  'ffmpeg: convert output files'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crunchy-labs/crunchy-cli/archive/v${pkgver}.tar.gz")
sha256sums=('845f416937f472f3ad0af7af50366819b865335744831fa4a27c818423898c77')

build() {
  cd "$srcdir/crunchy-cli-$pkgver"
  make build
}

package() {
  cd "$srcdir/crunchy-cli-$pkgver"
  make DESTDIR="$pkgdir" install
}
