# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=btnx-git
_pkgname=btnx
pkgver=r23.ef3f5b9
pkgrel=1
pkgdesc="A daemon that enables rerouting of mouse button events through uinput as keyboard and other mouse button combinations"
arch=('x86_64')
url='https://github.com/cdobrich/btnx'
license=('GPL2')
provides=('btnx')
depends=('btnx-config'
         'libdaemon'
         'bash')
makedepends=('git')
source=("btnx::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd btnx
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd btnx
  ./configure --prefix=/usr
  make
}

package() {
  cd btnx
  make DESTDIR="${pkgdir}" install
}