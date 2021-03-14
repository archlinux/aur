pkgname=ctucx-gallery
pkgver=0.1
pkgrel=13
arch=('x86_64')
pkgdesc="gallery as static-site-generator"
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick' 'libexif')
makedepends=( 'nim' 'nimble' )
_commit="f0d26d5a9496aa9e4ce65ed4d660746ff4df3e50"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('2659fae8ec446b163389dfd9529b265b87f6b381028d8cf6462d42f0c40e2e37')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
}
