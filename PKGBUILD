# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='python2-pytyle1-git'
_pkgname='python2-pytyle1'
pkgver=r30.fec5546
pkgrel=1
pkgdesc="An extremely versatile and extensible tiling manager that is meant
to be embedded into EWMH window managers"
arch=("any")
url="https://github.com/BurntSushi/pytyle1"
license=('GPL')
makedepends=('git')
depends=('python2-xlib')
source=($_pkgname::'git+https://github.com/BurntSushi/pytyle1')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
