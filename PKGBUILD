# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=meteor-rectify-git
pkgver=r5.fbab338
pkgrel=1
pkgdesc="Meteor-M2 image rectifier "
arch=(any)
license=(MIT)
url="https://github.com/dbdexter-dev/meteor_rectify"
depends=(python python-pillow python-numpy)
makedepends=(git)
provides=(meteor-rectify)
conflicts=(meteor-rectify)
source=("${pkgname}::git+https://github.com/dbdexter-dev/meteor_rectify.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -Dm755 rectify.py "${pkgdir}/usr/bin/meteor_rectify"
}
