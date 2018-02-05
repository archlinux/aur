# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=libutp-git
_pkgname=libutp
pkgver=r99.fda9f4b
pkgrel=1
pkgdesc='uTorrent Transport Protocol library'
url='https://github.com/bittorrent/libutp'
depends=('glibc')
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("git+https://github.com/transmission/libutp#branch=post-3.3-transmission")
sha256sums=('SKIP')

pkgver(){
 cd libutp
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' 

}

package() {
  cd $_pkgname
  make DESTDIR="${pkgdir}" install
}
