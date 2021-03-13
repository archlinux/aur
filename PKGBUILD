pkgname=ctucx-gallery
pkgver=0.1
pkgrel=6
arch=('x86_64')
pkgdesc="gallery as static-site-generator"
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick' 'libexif')
makedepends=( 'nim' 'nimble' )
_commit="3590fa16a36727aa6bd5ebcabe2d251b690a7373"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('09542a34724db3e2468a558e4b23db2a7ef0c3682e1e2dd70f95b0c7e4b82166')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
}
