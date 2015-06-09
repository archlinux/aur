# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=marble-restricted-maps
pkgname=$_pkgname-git
pkgver=latest
pkgrel=1
pkgdesc="Maps for the Marble desktop globe with restricted licenses"
arch=('any')
url="https://gitorious.org/marble-restricted-maps"
license=('unknown')
depends=('kdeedu-marble')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://git.gitorious.org/marble-restricted-maps/bayernsat.git'
        'git+https://git.gitorious.org/marble-restricted-maps/berlin.git'
        'git+https://git.gitorious.org/marble-restricted-maps/brandenburg.git'
        'git+https://git.gitorious.org/marble-restricted-maps/falk-osm.git'
        'git+https://git.gitorious.org/marble-restricted-maps/googlemaps.git'
        'git+https://git.gitorious.org/marble-restricted-maps/googlesat.git'
        'git+https://git.gitorious.org/marble-restricted-maps/mapquest.git'
        'git+https://git.gitorious.org/marble-restricted-maps/mecklemburg-vorpommern-osm.git'
        'git+https://git.gitorious.org/marble-restricted-maps/nordrhein-westfalen.git'
        'git+https://git.gitorious.org/marble-restricted-maps/norway_statkart_topo2.git'
        'git+https://git.gitorious.org/marble-restricted-maps/norway_statkart_toporaster2.git'
        'git+https://git.gitorious.org/marble-restricted-maps/osmarender.git'
        'git+https://git.gitorious.org/marble-restricted-maps/sachsen.git'
        'git+https://git.gitorious.org/marble-restricted-maps/virtualearth.git'
        'git+https://git.gitorious.org/marble-restricted-maps/virtualearthos.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

package() {
  mkdir -p "$pkgdir/usr/share/marble/data/maps/earth"
  cp -r * "$pkgdir/usr/share/marble/data/maps/earth"
  cd "$pkgdir/usr/share/marble/data/maps/earth"
  find . -name '.git' | xargs rm -rf
}

# vim:set ts=2 sw=2 et:
