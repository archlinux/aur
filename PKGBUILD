# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for pass-type upstream, git version
# pass-type adds support to files using pass
_pkgname=pass-type
pkgname=$_pkgname-git
pkgver=r15.cac22e2
pkgrel=1
pkgdesc=" A pass extension that allows to type passwords from your password-store."
arch=('i686' 'x86_64')
url="https://github.com/c4software/pass-type"
license=('MIT')
groups=()
depends=('pass')
makedepends=('git' 'sed')
# optdepends=('***: for that thing *** does')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/c4software/pass-type.git")
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
