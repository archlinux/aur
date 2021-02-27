pkgname=ctucx-gallery
pkgver=0.1
pkgrel=3
arch=('x86_64')
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick')
makedepends=( 'nim' 'nimble' )
_commit="61683e35da184be1eed8d3a70eaf6e86ec58c941"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('5c51402437ae81e8bf1dc1a4a13d2a9d5fce04d64fc5b614c79d5806d6f245d4')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
  install -Dm755 ${srcdir}/gallery-${_commit}/sample.config ${pkgdir}/etc/ctucx-${pkgname}.conf
}
