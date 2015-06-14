# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=svg2sif-git
pkgver=20130226
pkgrel=1
pkgdesc='An Inkscape extension that converts SVG files to Synfig Animation Studio (.sif) files.'
arch=(any)
url='https://github.com/nikitakit/svg2sif'
license=('GPL')
groups=()
depends=(inkscape python)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
_gitroot='git://github.com/nikitakit/svg2sif.git'
_gitname='svg2sif'
build(){
  cd "$srcdir"
  msg2 "Connecting to GIT server...."

  if [ -d ${_gitname}/.git ] ; then
    cd $_gitname
    git pull origin
    msg2 "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname
  fi

  msg2 "GIT checkout done or server timeout"
}
package(){
  cd "$srcdir"/$_gitname
  msg2 "Starting install"
  install -dm755 "$pkgdir"/usr/share/inkscape/extensions
  cp -r *.py *.inx "$pkgdir"/usr/share/inkscape/extensions
}

