# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=prettier-ada
pkgdesc='Pretty printer for Ada.'
pkgver=25.0w
pkgrel=1

url=https://github.com/AdaCore/prettier-ada
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada
         gnatcoll-core
         libvss)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240408-16284-src.tar.gz)
sha256sums=(d531db8e79372e25191383eac290e52bd202e47e7f124b20373961231baa2b4f)


build()
{
    cd $srcdir/$pkgname-$pkgver-20240505-164F8-src

    make all
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20240505-164F8-src

    PREFIX=$pkgdir/usr \
    make install 

    # Install the license.
    #
    install -D -m644 \
       LICENSE.txt   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}