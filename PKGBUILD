# Maintainer: Whyme Lyu <callme5long@gmail.com>
_pkgname=p3wm
pkgname=p3wm-git
pkgver=0.1.0.r0.07e6feb # not used anyway
pkgrel=1
pkgdesc="3-way merge .pacnew files"
arch=('any')
url="https://github.com/5long/p3wm"
license=('custom:ISC')
groups=()
depends=(
  'bash'
  'coreutils'
  'git'
  'pacman'
  'sed'
  'tar'
)
optdepends=('vim: default merge tool')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/5long/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$_pkgname"
	install -m=0755 -Dt "$pkgdir/usr/bin" bin/p3wm
	install -m=0644 -Dt "$pkgdir/usr/share/licenses" LICENSE
}
