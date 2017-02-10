# Maintainer: Tristan Webb <olafthefrog@gmail.com>

pkgname=ttyd-git
_gitname=ttyd
pkgver=r1.2.2_3b58edb
pkgrel=1
pkgdesc="Share your terminal over the web"
arch=('any')
url="https://github.com/tsl0922/ttyd.git"
license=('MIT')
builddepends=('cmake' 'base-devel')
depends=('libwebsockets-git')
source=(
  "git+https://github.com/tsl0922/ttyd.git"
  )
sha256sums=('SKIP')

build() {
    cd $srcdir/$_gitname && mkdir build
    cd build
    pwd
    cmake ..
    make 
}

package() {
  cd $srcdir/$_gitname/build
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
