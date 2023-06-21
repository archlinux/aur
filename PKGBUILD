# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Willem Mulder <14mRh4X0r@gmail.com>

_pkgname="argon"
pkgname="${_pkgname}-git"
pkgver=2.1.0
pkgrel=1
_pkgdesc=("the noble lightweight GUI package manager "
	  "+ update notifier (with full AUR support)")
pkgdesc="${_pkgdesc[*]}"
url="https://github.com/14mRh4X0r/${_pkgname}"
license=('GPL')
arch=('any')
depends=(
  bash
  auracle
  pacman-contrib
  pacaur
  libnotify
  python
  python-gobject
  gtk3
  vte3)
makedepends=(git)
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g' | sed 's/v//'
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir/" install
}
