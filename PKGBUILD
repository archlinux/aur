# Maintainer: JonnyRobbie

pkgname=gegl-operation-negative-darkroom-git
pkgver=v1.0.r1.ge382508
pkgrel=1
pkgdesc="GEGL operation - Negative Darkroom"
arch=('any')
url="https://gitlab.com/JonnyRobbie/gimp-plugin-analog"
license=('GPLv3')
depends=('gegl')
makedepends=('gegl')
source=('git+https://gitlab.com/JonnyRobbie/gimp-plugin-analog.git')
md5sums=('SKIP')
_gitname="gimp-plugin-analog"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/lib/gegl-0.4/"
  install -Dm644 "bin/negative-darkroom.so" "$pkgdir/usr/lib/gegl-0.4"
}

