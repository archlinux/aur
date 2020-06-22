# Maintainer: Milk Brewster (milk on freenode)
_pkgname=ubuntustudio-controls
pkgname=${_pkgname}-git
pkgver=1.8.r50.gdcbbd7f
pkgrel=1
pkgdesc="An audio setup utility."
arch=('x86_64')
url="https://github.com/ovenwerks/studio-controls"
license=('GPL')
groups=()
depends=('jack2' 'python' 'python-gobject' 'python-jack-client')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/ovenwerks/studio-controls')
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
