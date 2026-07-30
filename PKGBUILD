# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-tools
pkgdesc="AmneziaWG tools with AWG 3.0 (HeaderProtectionKey, padding, timing ranges)"
url="https://github.com/amnezia-vpn/amneziawg-tools"
arch=("x86_64")
pkgver=1.0.20260730.r535.c8aaf3d
pkgrel=1
license=('GPL-2.0')
depends=('bash')
makedepends=('git')
optdepends=('amneziawg-go: go implementation of amneziawg'
            'amneziawg-dkms: kernel module with AWG 3.0 support'
            'resolvconf: if you are controling DNS via AmneziaWG')
source=("git+https://github.com/amnezia-vpn/amneziawg-tools.git#branch=feat/awg3")
sha256sums=('SKIP')

pkgver() {
  cd amneziawg-tools
  printf "1.0.20260730.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd amneziawg-tools/src
  make
}

package() {
  cd amneziawg-tools/src
  make DESTDIR="${pkgdir}/" install
}
