# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for pass-spell upstream, git version
_pkgname=pass-spell
pkgname=$_pkgname-git
pkgver=0.1.0.r0.gbfc130c
pkgrel=1
pkgdesc="A pass extension for your ears."
arch=('i686' 'x86_64')
url="https://github.com/Qu4tro/pass-spell"
license=('GPL3')
groups=()
depends=('pass' 'nato-spell')
makedepends=('git' 'sed')
# optdepends=('***: for that thing *** does')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/Qu4tro/pass-spell.git")
md5sums=('SKIP')
pkgdir="/usr/lib"

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
