# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=gnatstudio-bin
pkgver=20240506
pkgrel=1
pkgdesc="GNAT Programming Studio for Ada binary"

arch=(i686 x86_64)
url=https://github.com/AdaCore/gnatstudio
license=(GPL3)

depends=("python")
conflicts=("gnat-gps")

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-$pkgver/GNAT_Studio-x86_64.AppImage
        COPYING3)

sha256sums=(a601fd886260cf53a586a9254d25df4c6d2059a842daf9f8ac8ed9969187cf61
            8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)


package() 
{
    options=(!strip)
   
    cd $srcdir

    ## Install the binary.
    #
    mkdir -p "$pkgdir/usr/bin"
    chmod a+x GNAT_Studio-x86_64.AppImage
    cp        GNAT_Studio-x86_64.AppImage "$pkgdir/usr/bin/gnatstudio"
    
    ## Install the license.
    #
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}