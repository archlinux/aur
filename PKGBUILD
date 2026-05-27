# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=gnatstudio-bin
pkgver=2026.2
pkgrel=1
epoch=1
pkgdesc="GNAT Programming Studio for Ada binary"

arch=(i686 x86_64)
url=https://github.com/AdaCore/gnatstudio
license=(GPL3)

depends=("python")
conflicts=("gnatstudio"
           "gnatstudio-appimage")

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-2026.2-20260409/gnatstudio-2026.2-20260409-x86_64-linux-bin.tar.gz
        COPYING3)

sha256sums=(4017aa6698253732dbb611d1f784846a3fd508ae74bd0979b5e50f0207402fb7
            8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)


package() 
{
#    options=(!strip)
   
    cd $srcdir/gnatstudio-2026.2-20260409-x86_64-linux-bin

    ./doinstall $pkgdir/opt/gnatstudio

    ## Install the license.
    #
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}