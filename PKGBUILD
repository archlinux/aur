# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=pokemon-go-map
pkgver=2.1.0
pkgrel=3
pkgdesc='Live visualization of all the pokemon in your area... and more! (stable releases)'
arch=('any')
url='https://jz6.github.io/PoGoMap/'
license=('GNU GPLv3+')
depends=( 'nodejs-grunt-cli' 'python2' 'npm' 'python2-configargparse' 'python2-flask-compress' 'python2-protobuf-to-dict' 'python2-peewee' 'python2-s2sphere' 'python2-flask-cors' 'python2-flask' 'python2-geopy' 'python2-protobuf' 'python2-requests' 'python2-gpsoauth' 'python2-werkzeug')
source=("https://github.com/AHAAAAAAA/PokemonGo-Map/archive/v${pkgver}.tar.gz")
md5sums=('fbba2ca161fadf68186f0fde5f671833')

build() {
  cd "${srcdir}/PokemonGo-Map-${pkgver}"
  npm install
  grunt build
  #npm run-script build
}

package() {
  cd "${srcdir}/PokemonGo-Map-${pkgver}"
  mkdir -p "${pkgdir}/opt/"
  cp -a "${srcdir}/PokemonGo-Map-${pkgver}" "${pkgdir}/opt/${pkgname}"
  rm -rf "${pkgdir}/opt/${pkgname}/node_modules"
}
