# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=nmap-grab-beacon-config-git
_pkgname=nmap-grab-beacon-config
pkgver=r6.c1bf891
pkgrel=1
pkgdesc="NMAP script for probing Cobalt Strike Beacon config"
arch=('any')
url="https://github.com/whickey-r7/grab_beacon_config"
license=('UNKNOWN')
depends=('nmap')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/whickey-r7/grab_beacon_config.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm644 grab_beacon_config.nse "${pkgdir}/usr/share/nmap/scripts/grab_beacon_config.nse"
}
