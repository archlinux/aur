# Maintainer: Andrew Scott <aur at andyscott dot me>
pkgname=ivpn-s6
pkgver=20230620
pkgrel=1
pkgdesc="s6 service script for IVPN"
arch=('any')
url="https://codeberg.org/andyscott/s6-scripts"
license=('GPL2')
provides=('init-ivpn-service')
depends=('s6' 'ivpn')
optdepends=('ivpn-ui: GUI for the IVPN client')
conflicts=('init-ivpn-service')
source=('ivpn-service.run::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/ivpn/run'
        'ivpn-service.type::https://codeberg.org/andyscott/s6-scripts/raw/branch/main/ivpn/type')
b2sums=('223ad8c413e9cc106caa39881274b40cd3ca39aa230799b88c3825a7de950558b1111da4fc43ba575ff7096f46492a452001f42207ca429f65dd1e7de1a9a461'
        'd64d49cff4f8f99eb08cf0a31d20f5b6908fabfcc055feab7d5b260bbdae4a39fc5e7be8d91a0d8f97ffe6da2d3924c4c3fa91be18130bc144fdd42a8e63de85')

package() {
  install -d "$pkgdir/etc/s6/sv/ivpn-service/"
  install -Dm644 'ivpn-service.run' "$pkgdir/etc/s6/sv/ivpn-service/run"
  install -Dm644 'ivpn-service.type' "$pkgdir/etc/s6/sv/ivpn-service/type"
}
