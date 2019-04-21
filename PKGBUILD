# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=sonic
pkgname=libsonic-git
pkgver=1
pkgrel=1
pkgdesc="Simple library to speed up or slow down speech"
arch=('any')
url="https://github.com/waywardgeek/sonic"
license=('Apache 2.0')
depends=('fftw' 'gcc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/waywardgeek/${_pkgname}.git")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  git shortlog | head -n 1 | tr -Cd "[:digit:]"
}
 
build()
{
cd "$_pkgname"
make
}

package()
 {
cd "$_pkgname"
make DESTDIR="$pkgdir/" install
  }

# vim:set ts=2 sw=2 et:
