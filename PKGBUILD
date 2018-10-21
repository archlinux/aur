 
# Maintainer: Jan Neumann <neum dot ja at gmail dot com>


pkgname=better-plasma5-video-wallpaper-git
_gitname=PlasmaVideoWallpaper
pkgver=r4.40ba42f
pkgrel=1
pkgdesc='Plasma 5 plugin for video-wallpaper without gap between loop'
arch=('any')
url='https://github.com/WuSiYu/PlasmaVideoWallpaper'
license=('GPL3')
depends=('plasma-desktop')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}
   
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}
            
build() {
   cd ${srcdir}/${_gitname}
   mkdir build && cd build
   cmake .. 
   
   make
   
}

package() {
   cd ${srcdir}/${_gitname}
   make -C ${srcdir}/${_gitname}/build DESTDIR="$pkgdir" install        

}
