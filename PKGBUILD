# Maintainer: Rob McFadzean <root@sphericalcube.net>

pkgname=docker-machine-vultr
pkgver=1.4.0
pkgrel=3
pkgdesc="Vultr driver for docker-machine"
url="https://github.com/janeczku/docker-machine-vultr/"
license=('MIT')
arch=('x86_64')
depends=(
  'docker-machine'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=("docker-machine-driver-vultr::https://github.com/janeczku/docker-machine-vultr/releases/download/v$pkgver/docker-machine-driver-vultr-Linux-$CARCH")
sha256sums=('46bc306ed8dc4c301b06352db370605bd589da9957565a03dc81a44b5d4788c0')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-vultr "$pkgdir/usr/bin/docker-machine-driver-vultr"
}
