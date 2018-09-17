# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Matthew Treinish <mtreinish@kortar.org>

_pkgname=openvpn-update-resolv-conf
pkgname="$_pkgname"-git
pkgver=r42.43093c2
pkgrel=2
pkgdesc="OpenVPN Update resolvconf"
arch=('any')
url="https://github.com/masterkorp/$_pkgname"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git')
depends=('openvpn' 'openresolv')
source=("git://github.com/masterkorp/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -D -m755 update-resolv-conf.sh "$pkgdir/etc/openvpn/update-resolv-conf"
}
