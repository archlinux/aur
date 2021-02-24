pkgname=ctucx-gallery
pkgver=0.1
pkgrel=1
arch=('x86_64')
url="https://cgit.ctu.cx/gallery/"
license=('GPL-3')
depends=('glibc' 'imagemagick')
makedepends=( 'nim' 'nimble' )
_commit="b961946a4f5a82274e94a21933bf7bb1dd59f78e"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/gallery/snapshot/gallery-${_commit}.tar.gz")
sha256sums=('4f4ca5fbd3e25b8f92928ac9aa9d036e3ef2009a367af7c957a79df6ba7fc730')

build() {
  cd $srcdir/gallery-${_commit}
  nimble build -d:release -y
}

package() {
  install -Dm755 ${srcdir}/gallery-${_commit}/gallery ${pkgdir}/usr/bin/ctucx-gallery
  install -Dm755 ${srcdir}/gallery-${_commit}/sample.config ${pkgdir}/etc/ctucx-${pkgname}.conf
}
