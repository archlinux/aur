# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>
# Contributor: Bartłomiej Bułat <bartek (dot) bulat (at) gmail (dot) com>

pkgname=deadbeef-gnome-mmkeys-git
_pkgname=deadbeef-gnome-mmkeys
pkgver=r45.96e5664
pkgrel=1
pkgdesc="DeaDBeeF player Gnome (via DBus) multimedia keys plugin"
url="https://github.com/zhanghai/deadbeef-gnome-mmkeys"
arch=('x86_64' 'i686')
license=('GPL')
depends=('deadbeef' 'glib2')
makedepends=('git')
source=(git+https://github.com/zhanghai/deadbeef-gnome-mmkeys.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make ROOTDIR="${pkgdir}/" install
}
