# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=opustags
pkgname=opustags-git
pkgver=0.206.4de428b
pkgrel=1
pkgdesc="View and edit tags for opus files from the command line."
arch=('any')
url="https://github.com/fmang/${_pkgname}"
license=('BSD3')
depends=('libogg')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/fmang/${_pkgname}.git")
md5sums=("SKIP")

 pkgver()
{
   cd "${srcdir}/${_pkgname}"
   echo "0.$(git rev-list --count HEAD).$(git describe --always)"
 }

build()
{
cd "${srcdir}/${_pkgname}"
cmake -DCMAKE_INSTALL_PREFIX=/usr
make
}

package()
 {
  cd "${srcdir}/${_pkgname}"
make DESTDIR="${pkgdir}" install
  }

# vim:set ts=2 sw=2 et:
