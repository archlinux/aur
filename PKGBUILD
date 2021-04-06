# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.5.9
pkgrel=2
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('custom:BSL', 'MPL-2.0')
install=${pkgname}.install
depends=(
 'docker'
 'git'
)

source=(
  "https://github.com/earthly/earthly/releases/download/v${pkgver}/earthly-linux-amd64"
)
sha512sums=(
  '7738f6360df29d8c513af820a603f05bfd6709a3b4dc8a8c1928216b8e1105803c7f92ad48a8469bedba12599e2a24316baf348a6a54b4b121b6e6c9623bfaf1'
)

prepare() {
  chmod +x earthly-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earthly-linux-amd64" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
