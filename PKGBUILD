# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=gnatstudio-bin
pkgver=20250417
pkgrel=1
pkgdesc="GNAT Programming Studio for Ada binary"

arch=(i686 x86_64)
url=https://github.com/AdaCore/gnatstudio
license=(GPL3)

depends=("python")
conflicts=("gnat-gps")

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-20250417/gnatstudio-26.0w-20250417-x86_64-linux-bin.tar.gz
        COPYING3)

sha256sums=(88c628d96af3a6189c99300ac682f5175dabc78c572140a1aea1771003c27f45
            8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)


package() 
{
#    options=(!strip)
   
    cd $srcdir/gnatstudio-26.0w-20250417-x86_64-linux-bin

    ./doinstall $pkgdir/opt/gnatstudio

    ## Install the license.
    #
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}