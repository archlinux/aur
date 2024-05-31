# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=libvss
pkgdesc='A high level string and text processing library for Ada.'
pkgver=25.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/VSS

arch=(i686 x86_64)
license=(Apache)

depends=(xmlada)
makedepends=(gprbuild)
         
source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/vss-25.0w-20240408-1642F-src.tar.gz)
sha256sums=(0c7aeaebcbacfb9fbb584ad769a179ee7771fc17f4a56cfe145b6d0b4de98bf0)


build()
{
   cd $srcdir/vss-25.0w-20240505-162CF-src
   make build-all-libs
}


package()
{
   cd $srcdir/vss-25.0w-20240505-162CF-src

   make DESTDIR=$pkgdir install-all-libs

   # Install the license.
   #
   install -D -m644     \
      LICENSE.txt       \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}