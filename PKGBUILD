# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.5.3
pkgrel=1
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
  '4af7492c715a8af9911b2c315bf689bf410eb31c35be6fee407b532486bde33d73d9672e562a460be0460aa5b04d628c9f074c8a020243e12e136b26ea658fee'
)

prepare() {
  chmod +x earthly-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earthly-linux-amd64" "${pkgdir}/usr/bin/earthly"
  ln -s "${pkgdir}/usr/bin/earthly" "${pkgdir}/usr/bin/earth"
}
