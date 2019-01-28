# Maintainer: Milk Brewster (milk on freenode)
_pkgname=ubuntustudio-controls
pkgname=${_pkgname}-git
pkgver=r212.1a1d7ce
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://launchpad.net/ubuntustudio-controls"
license=('GPL')
groups=()
depends=('jack2' 'python' 'python-gobject')
makedepends=('git')
provides=("${pkgname%}" "${pkgname%}-git")
conflicts=("${pkgname%}" "${pkgname%}-git")
replaces=()
backup=()
options=()
install=
source=('git+https://git.launchpad.net/ubuntustudio-controls')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$srcdir/${_pkgname%}"
}

build() {
	cd "$srcdir/${_pkgname%}"
}

check() {
	cd "$srcdir/${_pkgname%}"
}

package() {
	cd "$srcdir/${_pkgname%}"
  cp -r etc lib usr $pkgdir
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
  mv $pkgdir/lib $pkgdir/usr/lib

}
