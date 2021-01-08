# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('MPL-2.0')
install=${pkgname}.install
depends=(
 'docker'
 'git'
)

source=(
  "https://github.com/earthly/earthly/releases/download/v${pkgver}/earthly-linux-amd64"
)
sha512sums=(
  '6284351aa4a2228f04e7a0817ca3773eda1ce9f662c4c0ebba59df4309028dcd9fbd153a58acbf4fee76d030d13fea27e8b5c4b8641141241920c16a270999a7'
)

prepare() {
  chmod +x earthly-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earthly-linux-amd64" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
