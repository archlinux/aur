pkgname=ctucx-gallery
pkgver=0.1
pkgrel=9
arch=('x86_64')
pkgdesc="gallery as static-site-generator"
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick' 'libexif')
makedepends=( 'nim' 'nimble' )
_commit="978a243bf4aefd75d8b794abc823d225d3d97154"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('fe32ca12828634dc6fcd73508ad674eae6a2de584673e07e3b63041452a09a9f')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
}
