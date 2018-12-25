# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for pass-file upstream, git version
# pass-file adds support to files using pass
_pkgname=pass-file
pkgname=$_pkgname-git
pkgver=r7.1c7e6a0
pkgrel=1
pkgdesc=" A pass extension that allows to add files to your password-store."
arch=('i686' 'x86_64')
url="https://github.com/dvogt23/pass-file"
license=('GPL3')
groups=()
depends=('pass')
makedepends=('git' 'sed')
# optdepends=('***: for that thing *** does')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/dvogt23/pass-file.git")
md5sums=('SKIP')
pkgdir="/usr/lib"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
