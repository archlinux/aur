# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=meteor-demod-git
pkgver=r55.7ab2534
pkgrel=1
pkgdesc="Meteor-M2 LRPT demodulator"
arch=(any)
license=('GPL')
url="https://github.com/dbdexter-dev/meteor_demod"
depends=('ncurses')
makedepends=('git')
provides=('meteor-demod')
conflicts=('meteor-demod')
source=("$pkgname::git+https://github.com/dbdexter-dev/meteor_demod.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"

  install -Dm755 src/meteor_demod ${pkgdir}/usr/bin/meteor-demod
}

