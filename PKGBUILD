# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=rx
pkgver=0.5.2
pkgrel=1
pkgdesc='A modern and extensible pixel editor implemented in rust.'
arch=(i686 x86_64)
url='http://cloudhead.io/rx/'
license=('GPL3')
makedepends=('clang' 'rust' 'cmake' 'libx11')
source=("https://github.com/cloudhead/rx/archive/v${pkgver}.tar.gz")
sha256sums=('1a2a28afd7ea8a0cde030a12cb5d0d8543a68829edd789215cc4f1eaa5cc4d12')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  mkdir -p "${pkgdir}/usr/bin"

  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}-${pkgver}/target/release/rx"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}-${pkgver}/rx.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${srcdir}/${pkgname}-${pkgver}/rx.png"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps" "${srcdir}/${pkgname}-${pkgver}/rx.png"
}
