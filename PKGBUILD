# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
pkgdesc='A high level string and text processing library for Ada.'
pkgver=26.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/VSS

arch=(i686 x86_64)
license=(Apache)

depends=(xmlada)
makedepends=(gprbuild)
         
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/vss-26.0w-20250409-16384-src.tar.gz)
sha256sums=(30a79999a5667313e402147329bafb4806e7759bc49c7a0b06d9aa81910722f4)


build()
{
   cd $srcdir/vss-26.0w-20250416-16621-src
   
   make build-all-libs
}


package()
{
   cd $srcdir/vss-26.0w-20250416-16621-src

   make DESTDIR=$pkgdir install-all-libs

   # Install the license.
   #
   install -D -m644     \
      LICENSE.txt       \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}