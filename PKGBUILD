# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=prettier-ada
pkgdesc='Pretty printer for Ada.'
pkgver=26.0w
pkgrel=1

url=https://github.com/AdaCore/prettier-ada
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada
         gnatcoll-core
         libvss)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/prettier-ada-26.0w-20250407-163DE-src.tar.gz)
sha256sums=(1c7b44a673ca047bd69b061eabb5e2b70c73bebde0697c99d735ace83a736f8f)


build()
{
    cd $srcdir/prettier-ada-26.0w-20250416-1660F-src

    make all
}


package()
{
    cd $srcdir/prettier-ada-26.0w-20250416-1660F-src

    PREFIX=$pkgdir/usr \
    make install-all

    # Install the license.
    #
    install -D -m644 \
       LICENSE.txt   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}