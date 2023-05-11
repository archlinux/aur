# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A modern linux desktop application to visualize systemd logs."
arch=('x86_64')
url="https://github.com/mingue/journal-viewer"
license=('GPL3')
depends=(
  'systemd'
  'webkit2gtk'
)
optdepends=(
)
provides=('journal-viewer')
conflicts=('journal-viewer')

source_x86_64=(
  "$url/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_x86_64.tar.gz"
  "${pkgname/-bin/}.desktop"
)
sha256sums_x86_64=(
  '7a6c7d3c580e8ebe5dcfb2523e8a84802b07be768ad7c343092b2870cd35bac1'
  '475b19c2d1b971e91a624bb2fb4477e76e39834e70ce64035426b678b9376f0c'
)

package() {
  _output="${srcdir}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/${pkgname/-bin/}.desktop" -t "$pkgdir/usr/share/applications/"
}
