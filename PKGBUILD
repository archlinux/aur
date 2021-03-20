# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Old Maintainer:Lubosz Sarnecki <lubosz@gmail.com>
# Old Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
 
pkgname=python-cairo-git
pkgver=v1.20.0.r6.g4865f55
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library. Git version."
url="http://www.cairographics.org/"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('python' 'cairo>=1.12')
makedepends=('git' 'pkg-config')
options=('!libtool')
provides=("python-cairo=1.20.0")
conflicts=('python-cairo')
source=("${pkgname}::git://github.com/pygobject/pycairo")
sha256sums=('SKIP')
 
pkgver() {
    cd ${srcdir}/${pkgname}
    #PREFIX="pycairo_version        = '"
    #ver=$(grep "$PREFIX" setup.py | sed "s/$PREFIX//" | sed "s/'//")
    #revision=$(git rev-list --count HEAD)
    #hash=$(git log --pretty=format:'%h' -n 1)
    #echo $ver.$revision.$hash
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
package() {
    cd ${srcdir}/${pkgname}
    python3 setup.py install --root=${pkgdir}/ --optimize=1
}
 
# vim:set ts=4 sw=4 et:
