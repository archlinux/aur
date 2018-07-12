# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
pkgname=cellular-network-configs-git
_pkgname=${pkgname%-git}
pkgver=r14.184f463
pkgrel=1
pkgdesc="Configurations for using LimeSDR hardware with Osmocom and OpenAirInterface etc."
arch=('any')
url="https://github.com/myriadrf/cellular-network-configs"
license=('Apache')
makedepends=('git')
provides=('cellular-network-configs')
conflicts=('cellular-network-configs')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m644 "$pkgdir"/etc/$_pkgname/osmocom
  cp -dr --no-preserve=ownership "$srcdir"/$_pkgname/osmocom "$pkgdir"/etc/$_pkgname/osmocom
}
