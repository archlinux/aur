# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=vss-text
pkgdesc='A high level Unicode text processing library for Ada.'
pkgver=27.0w
pkgrel=1
#epoch=1

url=https://github.com/AdaCore/vss-text

arch=(i686 x86_64)
license=(Apache)

depends=(xmlada)
makedepends=(gprbuild)
         
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/vss-text-src.tar.gz)
sha256sums=(1774e982bc133644b22f4747cd817a70e038e80b59d9ff9ef0da5689439e861c)


build()
{
   cd $srcdir/vss-text-27.0w-20260324-1616F-src

   make build-all-libs
#   make all
}


package()
{
   cd $srcdir/vss-text-27.0w-20260324-1616F-src

   make install-all-libs PREFIX=$pkgdir/usr

#   make install PREFIX=$pkgdir/usr

   # Install the license.
   #
   install -D -m644     \
      LICENSE.txt       \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}