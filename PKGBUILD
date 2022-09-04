# Maintainer: ByteDream
pkgname=crunchy-cli
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('GPL3')

pkgver=2.3.1
pkgrel=1

replaces=('crunchyroll-go')

optdepends=(
  'ffmpeg: convert output files & use archive'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crunchy-labs/crunchy-cli/archive/v${pkgver}.tar.gz")
sha256sums=('ae6d7a19af49cf8f4a61005ebac390290a6cbeb65acbb2fe280e112c9bb149fc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION="$pkgver" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
