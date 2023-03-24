# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Iru Cai <https://vimacs.wehack.space>
# Contributor: Pierpaolo Valerio

pkgname=dpic
pkgver=2023.02.01
pkgrel=1
pkgdesc="A pic language interpreter."
arch=(
  'i686'
  'x86_64'
)
url="http://www.ece.uwaterloo.ca/~aplevich/${pkgname}/"
license=(
  'BSD'
)
depends=()
optdepends=()
makedepends=()
source=(
  "https://ece.uwaterloo.ca/~aplevich/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  'd059ff28c04552066c164fb146fee8e0101b953e46e75919b3dcfaa99b031ae6'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir/usr install
} 
