# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=opustags
pkgname=opustags-git
pkgver=0.36.fcd6470
pkgrel=2
pkgdesc="View and edit tags for opus files from the command line."
arch=('any')
url="https://github.com/fmang/$_pkgname"
license=('BSD3')
depends=('libogg')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/fmang/$_pkgname.git")
md5sums=("SKIP")

 pkgver()
{
   cd "$srcdir/$_pkgname"
   echo "0.$(git rev-list --count HEAD).$(git describe --always)"
 }

build()
{
cd "$srcdir/$_pkgname"
make
}

package()
 {
  cd "$srcdir/$_pkgname"
make PREFIX=/usr DESTDIR="$pkgdir/usr" install
  }

# vim:set ts=2 sw=2 et:
