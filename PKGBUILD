# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=rx
pkgver=0.4.0
pkgrel=1
pkgdesc='A modern and extensible pixel editor implemented in rust.'
arch=(i686 x86_64)
url='http://cloudhead.io/rx/'
license=('GPL3')
makedepends=('clang' 'rust' 'cmake')
source=("https://github.com/cloudhead/rx/archive/v${pkgver}.tar.gz")
sha256sums=('aa7786b000d10d9e3675c9d6505541fbf310c090f3b7215998e1208beda6df55')

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
