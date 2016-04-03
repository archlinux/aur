# Maintainer: Ilya Basin <basinilya@gmail.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

_pkgname=gedit-autotab
pkgname=gedit-autotab-git
pkgver=r45.cc70af2
pkgrel=1
pkgdesc="Automatically detect tab preferences for source files"
arch=('any')
url="https://github.com/kapouer/gedit-autotab"
license=('GPL3')
depends=('gedit')
source=('git+https://github.com/kapouer/gedit-autotab.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/gedit-autotab"
  #patch -Np1 -i "$srcdir/nosavelistener.patch"
  install -d "$pkgdir/usr/lib/gedit/plugins"
  install -m644 -t "$pkgdir/usr/lib/gedit/plugins/" autotab.{plugin,py}
}

# vim:set ts=2 sw=2 et:

