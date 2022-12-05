# Maintainer: Gerardo Gomez <gerardo.gomez@tutanota.com>

pkgname=docker-compose-v2-bin
pkgver=2.14.0
pkgrel=1
pkgdesc="Standalone Golang-based package of a tool for running multi-container applications on Docker defined using the Compose file format"
depends=()
arch=('x86_64')
conflicts=('docker-compose')
provides=('docker-compose')
options=(!strip)
source=(
  "docker-compose-v$pkgver::https://github.com/docker/compose/releases/download/v$pkgver/docker-compose-linux-x86_64"
  "LICENSE::https://github.com/docker/compose/releases/download/v$pkgver/LICENSE"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('fdf634ab2b01aca33372bef2bf866699ef2e1f2dab19972e37967b1fc2a11402'
            'fb89efa30f0bf9c372a6519ae9693c7e7824c5b4900135967581a923ca7072b0')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-v$pkgver" "$pkgdir/usr/bin/docker-compose"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
