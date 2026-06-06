# Maintainer: upi@mis.my.id
pkgname=wewbo
pkgver="1.4.0"
pkgrel=1
pkgdesc="Interactive terminal application for streaming and downloading anime"
arch=('x86_64')
url="https://github.com/upi-0/wewbo"
license=('GPL3')
depends=('mpv' 'ffmpeg')
makedepends=('nim' 'git')   # build deps
source=("https://github.com/upi-0/wewbo/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')
build() {
  cd "$srcdir/wewbo-${pkgver}"

  # compile binary
  nimble build -y
}
package() {
  cd "$srcdir/wewbo-${pkgver}"

  install -Dm755 "wewbo" "$pkgdir/usr/bin/wewbo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
