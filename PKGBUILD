# vim: set ts=2 sw=2 et:
# Maintainer: Wang Ling <lingwang@wcysite.com>

pkgname=ieda
pkgver=1.0.3e8373a
pkgrel=1
pkgdesc="An open-source EDA infracstrucutre and tools from netlist to GDS for ASIC design."
arch=('any')
url="https://github.com/OSCC-Project/iEDA/"
license=('custom:MulanPSL2')
depends=()
makedepends=('podman')
provides=('iEDA')
conflicts=()
source=()
sha256sums=()

#prepare() {
#}

build() {
  podman run -it -v $srcdir/bin:/opt/iEDA/bin --rm docker.io/iedaopensource/base:latest bash build.sh
  podman rmi iedaopensource/base
}

package() {
  install -Dm755 $srcdir/bin/iEDA $pkgdir/usr/bin/iEDA
}
