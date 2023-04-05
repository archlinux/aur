# Maintainer: Victor Mingueza <victormingueza at gmail.com>
pkgname=journal-viewer-bin
pkgver=0.1.2
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
  'e728a9f81f76148227f02a1ac5c7ca1b0fd54a5dfb151237efdf9780e6688c39'
  'f99f71bd504a0360ed7164ae13d203889b9a3dfaf7e33d73246cd609d212f52e'
)

package() {
  _output="${srcdir}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/${pkgname/-bin/}.desktop" -t "$pkgdir/usr/share/applications/"
}
