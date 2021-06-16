# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.5.17
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
  'a677f5c9aa9654df9db847160e920a929c5cc90e3485e94d69ac4b1f385f3c0fd22f909c91b7779e24d67652043be49ae4033834060ebe5d3fa14dbde1db7a7b'
)

prepare() {
  chmod +x earthly-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earthly-linux-amd64" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
