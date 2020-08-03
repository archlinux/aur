# Maintainer: Milk Brewster (milk/milkii on Freenode)
pkgname=pomobar-git
pkgdesc="Pomodoro timer to polybar"
pkgver=r26.e1abc23
pkgrel=1
epoch=
arch=('any')
url="https://github.com/loopzen/pomobar"
license=('unknown')
groups=()
depends=('git' 'python')
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
source=("pomobar-git::git+https://github.com/loopzen/pomobar")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }

package() {
	cd "$pkgname"
	install -Dm755 pomobar.py "$pkgdir/usr/share/polybar/scripts/pomobar.py"
}
