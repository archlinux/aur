# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Matthew Treinish <mtreinish@kortar.org>

_pkgname=openvpn-update-resolv-conf
pkgname="$_pkgname"-git
pkgver=r46.2485e9d
pkgrel=1
pkgdesc="OpenVPN Update resolvconf"
arch=('any')
url="https://github.com/alfredopalhares/$_pkgname"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git')
depends=('openvpn' 'openresolv')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -D -m755 update-resolv-conf.sh "$pkgdir/etc/openvpn/update-resolv-conf"
}
