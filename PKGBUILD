# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Willem Mulder <14mRh4X0r@gmail.com>

pkgname=argon-git
pkgver=2.1.0
pkgrel=1
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="https://github.com/14mRh4X0r/arch-argon"
license=('GPL')
arch=('any')
depends=(bash auracle-git pacman-contrib pacaur libnotify python python-gobject gtk3 vte3)
makedepends=(git)
source=("argon-git::git+https://github.com/14mRh4X0r/arch-argon.git")
sha512sums=('SKIP')
provides=('argon')
conflicts=('argon')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g' | sed 's/v//'
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir/" install
}
