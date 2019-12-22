# Maintainer:  <code@lab-11>
pkgname=lutra
pkgver=21227b8
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('BSD-2-Clause')
groups=()
depends=('pacman')
makedepends=('git' 'ponyc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git://github.com/code-monad/lutra')
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's|-|.|g'
  # To give the total count of commits and the hash of the last one
  # (useful if you're making a repository with git packages so that they can have
  # sequential version numbers, else a "pacman -Syu" may not update the package):
  #echo "0.$(git rev-list --count $branch).$(git describe --always)"
  # Using the last commit date:
  #git log -1 --format="%cd" --date=short | sed 's|-||g'
}


build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
