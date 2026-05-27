# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=lal-refactor
pkgdesc='A collection of source code refactoring tools for Ada.'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/lal-refactor'

arch=(i686 x86_64 aarch64)
license=(Apache-2.0)

depends=(gcc-ada adasat libadalang-tools)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/lal-refactor-src.tar.gz)
sha256sums=(d996b39a0a5898c88e1b4ac8d40d5778341aeda609eb21929a603f36bec112fd)


build()
{
   cd $srcdir/lal-refactor-27.0w-20260409-16484-src

   LIBRARY_TYPE=relocatable make lib
   LIBRARY_TYPE=relocatable make bin
}


package()
{
   cd $srcdir/lal-refactor-27.0w-20260409-16484-src

   make PREFIX=$pkgdir/usr install

   ## Install the license.
   #
   install -D -m644 \
      LICENSE.txt   \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
