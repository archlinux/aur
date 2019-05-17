# Maintainer: Simone Scalabrino <s dot scalabrino 9 at gmail dot com>

pkgname=qtws-base
_gitname=qtws
_gittag=0.92
pkgver=$_gittag
pkgrel=1
pkgdesc='Standalone web-app container based on qt5-webengine'
arch=('i686' 'x86_64')
url='https://github.com/intersimone999/qtws'
license=('GPL3')
depends=('xdg-utils' 'qt5-webengine')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

# pkgver() {
#    cd ${srcdir}/${_gitname}
#    
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
# 
# }
            
build() {
   cd ${srcdir}/${_gitname}
   git checkout $_gittag

   qmake -config release
   make
   
}

package() {
   install -Dm755 ${srcdir}/${_gitname}/qtws ${pkgdir}/usr/bin/qtws
}
 
