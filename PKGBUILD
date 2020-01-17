# Maintainer: Ales Katona <almindor@gmail.com>
pkgname=rx
pkgver=0.3.2
pkgrel=1
pkgdesc='A modern and extensible pixel editor implemented in rust.'
arch=(i686 x86_64)
url='http://cloudhead.io/rx/'
license=('GPL3')
makedepends=('clang' 'rust')
source=("https://github.com/cloudhead/rx/archive/v${pkgver}.tar.gz")
sha256sums=('721b1c16a11da78e95b62fa239669a54593e5318324b759233b7f4aefb611ea8')

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
