# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=prettier-ada
pkgdesc='Pretty printer for Ada.'
pkgver=27.0w
pkgrel=1

url=https://github.com/AdaCore/prettier-ada
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada
         gnatcoll-core
         vss-text)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/prettier-ada-src.tar.gz)
sha256sums=(eb4d22ae96746161a29718b18b45fb29f214d69e3726a7e8abfb08d3187c71f2)


build()
{
    cd $srcdir/prettier-ada-27.0w-20260324-166DC-src

    make all
}


package()
{
    cd $srcdir/prettier-ada-27.0w-20260324-166DC-src

    PREFIX=$pkgdir/usr \
    make install-all

    # Install the license.
    #
    install -D -m644 \
       LICENSE.txt   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}