# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map-dev-git
_gitname=PokemonGo-Map
pkgver=1
pkgrel=4
pkgdesc='Live visualization of all the pokemon in your area... and more! (dev branch)'
arch=('any')
url='https://jz6.github.io/PoGoMap/'
license=('GNU GPLv3+')
depends=( 'python2' 'python2-flask-compress' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("git://github.com/AHAAAAAAA/${_gitname}#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_gitname/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/$_gitname/"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -a * "${pkgdir}/opt/${pkgname}"

  # workaround for issue #1348
  mkdir -P "${pkgdir}/opt/${pkgname}/config"
  chmod -R 777 "${pkgdir}/opt/${pkgname}/config"
}
