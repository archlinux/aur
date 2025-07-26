# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=lal-refactor
pkgdesc='A collection of source code refactoring tools for the Ada.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/lal-refactor

arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada adasat libadalang-tools)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/lal-refactor-26.0w-20250416-165F5-src.tar.gz)
sha256sums=(35f8ceb361923a80171570ab585532e1a1870f76bbe59208540501183a0ca022)


build()
{
   cd $srcdir/lal-refactor-26.0w-20250416-165F5-src

   export LIBRARY_TYPE=relocatable

   make lib
   make bin
}


package()
{
   cd $srcdir/lal-refactor-26.0w-20250416-165F5-src

   PREFIX=$pkgdir/usr \
   make install

   # Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}