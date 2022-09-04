# Maintainer: ByteDream
pkgname=crunchy-cli
pkgdesc="A cli for downloading videos and entire series from crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('GPL3')

pkgver=2.3.2
pkgrel=1

replaces=('crunchyroll-go')

optdepends=(
  'ffmpeg: convert output files & use archive'
)
makedepends=(
  'go'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crunchy-labs/crunchy-cli/archive/v${pkgver}.tar.gz")
sha256sums=('af77e13ddca208ecfee475e64549f32c20e514fa919a75485a6daa3fa675acb1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION="$pkgver" build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
