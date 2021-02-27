pkgname=ctucx-gallery
pkgver=0.1
pkgrel=2
arch=('x86_64')
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick')
makedepends=( 'nim' 'nimble' )
_commit="d048a405c822d40e4a3d15fb2f9aa0f08a03cae1"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('0b5f4da36b7e6ad78d01c31872a4d47f4b5114ac83532033e59ce084bd42fc0e')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
  install -Dm755 ${srcdir}/gallery-${_commit}/sample.config ${pkgdir}/etc/ctucx-${pkgname}.conf
}
