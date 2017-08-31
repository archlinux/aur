# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=marble-restricted-maps
pkgname=$_pkgname-git
pkgver=latest
pkgrel=3
pkgdesc="Maps for the Marble desktop globe with restricted licenses"
arch=('any')
url="https://gitlab.com/marble-restricted-maps"
license=('unknown')
depends=('marble-common')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://gitlab.com/marble-restricted-maps/googlemaps.git'
        'git+https://gitlab.com/marble-restricted-maps/googlesat.git'
        'git+https://gitlab.com/marble-restricted-maps/virtualearth.git'
        'git+https://gitlab.com/marble-restricted-maps/virtualearthos.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/marble/data/maps/earth"
  cp -r * "$pkgdir/usr/share/marble/data/maps/earth"
  find "$pkgdir/usr/share/marble/data/maps/earth"  -name '.git' | xargs rm -rf
}

# vim:set ts=2 sw=2 et:
