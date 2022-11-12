_pkgname=jpeg-recompress
pkgname=${_pkgname}-git
pkgver=2.2.0
pkgrel=1
pkgdesc='Utilities for archiving JPEGs for long term storage - IPEP fork (fixes and webp support)'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}"
license=(MIT)
depends=(
  libiqa
  libjpeg
  libsmallfry
)
makedepends=(git)
optdepends=()
provides=("${_pkgname}" jpeg-archive)
conflicts=(${provides[@]})
source=(
  "${_pkgname}-git"::"git+https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "$srcdir/${_pkgname}-git"
  make
}

package() {
  cd "$srcdir/${_pkgname}-git"
  make PREFIX="$pkgdir/usr" install
}
