pkgname=ctucx-gallery
pkgver=0.1
pkgrel=15
arch=('x86_64')
pkgdesc="gallery as static-site-generator"
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick' 'libexif')
makedepends=( 'nim' 'nimble' )
_commit="010cafd5f54fbcce2add550c2b52b96e33d26f25"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('1ae86a91c9b11eec56b5603710cc7e419e704ee22b95515ce52228bb38094b8f')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
}
