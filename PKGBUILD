pkgname=ctucx-gallery
pkgver=0.1
pkgrel=5
arch=('x86_64')
pkgdesc="gallery as static-site-generator"
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick')
makedepends=( 'nim' 'nimble' )
_commit="720f8230846802d0e0f41afe6961f7c86aa35cd4"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('0117ce2b76dfa0fb4764799f8233cfdb5208b0dec4d276d3cc1ff5678165956e')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
}
