# Maintainer: Frederic Van Assche <frederic@fredericva.com>

pkgname=kicad-packages3d-git
_pkgname=kicad-packages3D
pkgver=4e34135f
pkgrel=2
pkgdesc="Official KiCad 3D model libraries for rendering and MCAD integration"
arch=('any')
url="https://github.com/KiCad/kicad-packages3D"
license=('GPL')
options=('!strip')
makedepends=('cmake' 'git')
conflicts=('kicad-library-bzr' 'kicad-library-git' 'kicad-library-3d' 'kicad-library')
source=("git://github.com/KiCad/kicad-packages3D.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD # Fix to better comply with github display
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/share/kicad/modules/packages3d"

  cp -r "$srcdir/$_pkgname"/* "$pkgdir/usr/share/kicad/modules/packages3d/"
}
