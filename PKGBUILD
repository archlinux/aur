# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=libutp-git
_pkgname=libutp
pkgver=r6.33a3b90
pkgrel=1
epoch=1
pkgdesc='uTorrent Transport Protocol library'
url='https://github.com/bittorrent/libutp'
depends=('glibc')
provides=('libutp')
arch=('i686' 'x86_64')
license=('custom:Public Domain')
source=("git+https://github.com/FragmentsApp/libutp.git")
sha256sums=('SKIP')

pkgver(){
 cd libutp
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd libutp
  arch-meson build
  DESTDIR=$pkgdir ninja -C build install
}
