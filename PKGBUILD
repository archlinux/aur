# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=xdiff-ada
pkgdesc='An Ada binding to the xdiff library.'
pkgver=27.0w
pkgrel=1

url='https://github.com/AdaCore/xdiff'

arch=(i686 x86_64 aarch64)
license=(GPL-3.0-only)

makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/xdiff-src.tar.gz)
sha256sums=(8adb2af5c390bf1894b0cd1cf7dad1275d665bbda23d06804043ca67bba98a54)


build()
{
   cd $srcdir/xdiff-27.0w-20260409-16729-src

   make
}


package()
{
   cd $srcdir/xdiff-27.0w-20260409-16729-src

   make DESTDIR=$pkgdir/usr install


   ## Install the license.
   #
   install -D -m644 \
      LICENSE       \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
