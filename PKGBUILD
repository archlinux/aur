# Maintainer: Francois Menning <f.menning@pm.me>

_pkgname=volantes-cursors
pkgname=volantes-cursors-git
pkgver=r4.f5dd936
pkgrel=1
pkgdesc='Classic cursor with a flying style.'
arch=('any')
url='https://github.com/varlesh/volantes-cursors'
license=('GPL2')
makedepends=('git' 'inkscape' 'xorg-xcursorgen')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/varlesh/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make build
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
