# Maintainer: Rod Kay   <rodakay5 at gmail dot com>

pkgname=gnatstudio-bin
pkgver=20220512
pkgrel=4
pkgdesc="GNAT Programming Studio for Ada binary"

arch=(i686 x86_64)
url=https://github.com/AdaCore/gnatstudio
license=(GPL3)

depends=("python" "libxcrypt-compat")
conflicts=("gnat-gps")

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-cr-20220512/gnatstudio-23.0w-20220512-x86_64-linux-bin.tar.gz)
sha256sums=(788bde77af2affb0797a783e2f158ca230d89858c0e4eb18355abd20e146baa0)


prepare()
{
    cd $srcdir
    tar -xvzf gnatstudio-23.0w-20220512-x86_64-linux-bin.tar.gz
}


package() 
{
    cd $srcdir/gnatstudio-23.0w-20220512-x86_64-linux-bin

    ./doinstall "$pkgdir/opt/gnatstudio"

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}