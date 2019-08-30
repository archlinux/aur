# Maintainer: Milk Brewster (milk/milkii on Freenode)
pkgname=pomobar
pkgver=r23.b613959
pkgrel=1
epoch=
pkgdesc=""
arch=('any')
url="https://github.com/loopzen/pomobar"
license=('unknown')
groups=()
depends=('python')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/loopzen/pomobar")
noextract=()
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
}

pkgver() {
	cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }

build() {
	cd "$pkgname"
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	install -Dm755 pomobar.py "$pkgdir/usr/share/polybar/scripts/pomobar.py"
}
