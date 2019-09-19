# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=meteor-decode-git
pkgver=r28.607c0ad
pkgrel=1
pkgdesc="Meteor-M2 LRPT decoder"
arch=(any)
license=('GPL')
url="https://github.com/dbdexter-dev/meteor_decode"
depends=('libpng')
makedepends=('git')
provides=('meteor-decode')
conflicts=('meteor-decode')
source=("$pkgname::git+https://github.com/dbdexter-dev/meteor_decode.git")
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

  install -Dm755 src/meteor_decode ${pkgdir}/usr/bin/meteor-decode
}

