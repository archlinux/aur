# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
pkgdesc='A high level string and text processing library for Ada.'
pkgver=24.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/VSS

arch=(i686 x86_64)
license=(Apache)

makedepends=(gprbuild)
         
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/vss-24.0w-20230428-1628B-src.tar.gz)
sha256sums=(560c3ee35e710dacf2a0f929ab23c220ba0c0d1e72e3e6a14793a58a96553776)


build()
{
   cd $srcdir/vss-24.0w-20230428-1628B-src
   make build-all-libs
}


package()
{
   cd $srcdir/vss-24.0w-20230428-1628B-src

   make DESTDIR=$pkgdir install-all-libs

   # Install the license.
   #
   install -D -m644     \
      LICENSE.txt       \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}