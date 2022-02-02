# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=awk-geohash-git
pkgver=r1.9a49980
pkgrel=1
pkgdesc="AWK implementation of geohash"
arch=('any')
url="https://github.com/esovetkin/awk-geohash"
license=('BSD')
depends=('gawk')
makedepends=('git')
sha256sums=('SKIP')
provides=('geohash')
source=('git+https://github.com/esovetkin/awk-geohash.git')


_gitroot=git://github.com/esovetkin/awk-geohash
_gitname=awk-geohash

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  # Install the program
  install -Dm755 geohash "${pkgdir}/usr/bin/geohash"
}

# vim:set ts=2 sw=2 et:
