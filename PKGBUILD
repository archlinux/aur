# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=kicad-footprints-git
_pkgname=${pkgname%-*}
pkgver=dae2bc57
pkgrel=2
pkgdesc="Official KiCad footprint libraries"
arch=('any')
url="https://github.com/KiCad/kicad-footprints"
license=('GPL')
options=('!strip')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library')
source=("git://github.com/KiCad/kicad-footprints.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/kicad/modules/"

  cp -r "$srcdir/$_pkgname"/* "$pkgdir/usr/share/kicad/modules/"
}
