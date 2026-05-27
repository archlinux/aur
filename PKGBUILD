# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=vss-extra
pkgdesc='Ada libraries for handling JSON, Regexp, XML and other features based on vss-text.'
pkgver=27.0w
pkgrel=1
#epoch=1

url=https://github.com/AdaCore/vss-extra

arch=(i686 x86_64)
license=(Apache)

depends=(vss-text)
makedepends=(gprbuild)
         
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/vss-extra-src.tar.gz)
sha256sums=(d09625671f1b4d29e6f79ccf36dc1a314499290021c6ae38e5e6025bb3d96528)


build()
{
   cd $srcdir/vss-extra-27.0w-20260409-167B2-src
   
   make build-all-libs
   #make all
}


package()
{
   cd $srcdir/vss-extra-27.0w-20260409-167B2-src

   make install-all-libs PREFIX=$pkgdir/usr
   #make install PREFIX=$pkgdir/usr

   # Install the license.
   #
   install -D -m644     \
      LICENSE.txt       \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}