# Maintainer: Andrew Whatson <whatson@gmail.com>
# Contributor: Glen D'souza <gdsouza@linuxmail.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>

pkgname=flightgear-data-git
pkgver=2020.4.0r9837.d145a52ac
pkgrel=1
pkgdesc="Base data for the flightgear flight simulator."
arch=('any')
url="https://home.flightgear.org"
options=(!strip)
license=('GPL')
makedepends=('git')
provides=("flightgear-data=${pkgver}")
conflicts=('flightgear-data')
source=("flightgear-data::git+git://git.code.sf.net/p/flightgear/fgdata#branch=next")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/flightgear-data
  printf "%sr%s.%s" \
    "$(tr -d '\n' < version)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir"/usr/share/flightgear
  mv "$srcdir"/flightgear-data "$pkgdir"/usr/share/flightgear/data
}
