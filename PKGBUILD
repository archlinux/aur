pkgname=ctucx-gallery
pkgver=0.1
pkgrel=10
arch=('x86_64')
pkgdesc="gallery as static-site-generator"
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick' 'libexif')
makedepends=( 'nim' 'nimble' )
_commit="3d2821954ec24623c80a42bff32665c71cf49b2d"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('dd4b150b5c05bce3486f702afb28d06da543e437fabe0e5112cf0e8a8c034d9a')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
}
