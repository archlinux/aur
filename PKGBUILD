# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.5.10
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
  '734af8e869b79015b567ee9968a4b0df9d00608b6675e699debe0933ff7361a007580386df67a5d3b95df60de8f63f003e3cedb6f379d5e39de5339c3cbc3c0e'
)

prepare() {
  chmod +x earthly-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earthly-linux-amd64" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
