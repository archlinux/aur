# Maintainer: Dario Pellegrini <pellegrini.dario@gmail.com>
# Contributor: Brice Waegeneire <brice.wge@gmail.com>
# Contributor: moeb, https://github.com/moeb

pkgname=freecad-cadquery-git
pkgver=1.2.0.r32.g8062976
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="CadQuery module for freecad"
url="https://github.com/jmwright/cadquery-freecad-module"
provides=('cadquery-freecad-module')
depends=('freecad')
makedepends=('git')
license=('LGPL3')
source=('git+https://github.com/jmwright/cadquery-freecad-module.git')
md5sums=('SKIP')
_moddir=usr/lib/freecad/Mod/CadQuery
_pkgname=cadquery-freecad-module

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/${_pkgname}
    mkdir -p $pkgdir/$_moddir
    cp -r . $pkgdir/$_moddir
}
