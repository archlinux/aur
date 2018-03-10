 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=nomad-plasma-look-and-feel-git
_gitname=nomad-plasma-look-and-feel
pkgver=r112.16356a4
pkgrel=1
pkgdesc="Nomad Look and Feel package."
arch=('any')
url="https://github.com/nomad-desktop/nomad-plasma-look-and-feel"
license=('GPL')
depends=('plasma-desktop' 'luv-icon-theme-git' 'kvantum-qt5')
optdepends=('nomad-gtk-themes')
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
   cmake .. \
     -DCMAKE_INSTALL_PREFIX=/usr
   
}

package() {
   
   make -C ${srcdir}/${_gitname}/build DESTDIR="$pkgdir" install        

}

