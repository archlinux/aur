# Maintainer: istimaldar_sntlk <istimaldar@gmail.com>
pkgname=earthly-bin
pkgver=0.3.19
pkgrel=1
pkgdesc='Build automation for the container era'
arch=('x86_64')
url='https://earthly.dev'
license=('MPL-2.0')
install=earthly-bin.install
depends=(
 'docker'
 'git'
)

source=(
  "https://github.com/earthly/earthly/releases/download/v${pkgver}/earth-linux-amd64"
)
sha512sums=(
  'f4a3db97071e58bd568e2fff1da7dc1336eb0bbf044a2dc28079015448eabb679f8e04771304cbbd2cb9aab5ca65a27c23bcdce9f4d74f555b1fa67d02885eed'
)

prepare() {
  chmod +x earth-linux-amd64
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/earth-linux-amd64" "${pkgdir}/usr/bin/earth"
}
