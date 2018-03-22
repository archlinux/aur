# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for pony-stable upstream, git version
# pony-stable is a package manager for pony lang
_pkgname=pony-stable
pkgname=$_pkgname-git
pkgver=0.1.0.13.g8b4f3ac
pkgrel=1
pkgdesc="A simple dependency manager for the Pony language."
arch=('i686' 'x86_64')
url="https://github.com/ponylang/pony-stable"
license=('BSD-2-Clause')
groups=()
depends=('ponyc')
makedepends=('git' 'sed')
# optdepends=('***: for that thing *** does')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/$_pkgname.conf")
source=("$_pkgname::git+https://github.com/ponylang/pony-stable.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc/local/$_pkgname"
}
