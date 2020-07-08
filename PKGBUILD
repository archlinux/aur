# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=btnx-config-git
_pkgname=btnx-config
pkgver=r30.0b30428
pkgrel=1
pkgdesc="A configuration tool for btnx (Button Extension)"
arch=('x86_64')
url='https://github.com/cdobrich/btnx-config'
license=('GPL2')
provides=('btnx-config')
depends=('libglade')
makedepends=('git')
source=("btnx-config::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd btnx-config
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd btnx-config
  ./configure --prefix=/usr
  make
}

package() {
  cd btnx-config
  make DESTDIR="${pkgdir}" install
}