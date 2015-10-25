# Contributor: itsme <mymail@ishere.ru>

pkgname=csstidy-cpp-git
_gitname=csstidy-cpp
pkgver=r43.8a5e5d4
pkgrel=1
pkgdesc="Fork of the C++ version of CSSTidy"
arch=('i686' 'x86_64')
url="https://github.com/dmitryleskov/csstidy-cpp/"
license=('GPL')
depends=('gcc-libs')
makedepends=('scons')
conflicts=('csstidy')
provides=('csstidy')
source=("git://github.com/dmitryleskov/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  scons || return 1
}

package() {
  cd "$_gitname"
  install -D release/csstidy/csstidy $pkgdir/usr/bin/csstidy
}
