# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Matthew Treinish <mtreinish@kortar.org>

pkgname=openvpn-update-resolv-conf-git
pkgver=r42.43093c2
pkgrel=1
pkgdesc="OpenVPN Update resolvconf"
arch=('any')
url="https://github.com/masterkorp/openvpn-update-resolv-conf"
license=('GPL')
provides=('openvpn-update-resolv-conf')
conflicts=('openvpn-update-resolv-conf')
makedepends=('git')
depends=('openvpn' 'openresolv')
source=('git://github.com/masterkorp/openvpn-update-resolv-conf')
sha256sums=('SKIP')

pkgver() {
  cd openvpn-update-resolv-conf
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd openvpn-update-resolv-conf
  install -D -m655 update-resolv-conf.sh "$pkgdir/etc/openvpn/update-resolv-conf"
}
