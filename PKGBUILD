# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=adasat
pkgdesc='Implementation of a DPLL-based SAT solver in Ada.'
pkgver=26.0w
pkgrel=1

url=https://github.com/AdaCore/AdaSAT
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/adasat-26.0w-20250407-164DB-src.tar.gz)
sha256sums=(2a483826bb98c9350522280e6ae481e8ff4fb01f28f880d45628cc6fa6be9e0c)


build()
{
    cd $srcdir/adasat-26.0w-20250416-164FF-src

    BUILD_MODE=prod \
    make all-libs
}


package()
{
    cd $srcdir/adasat-26.0w-20250416-164FF-src

    BUILD_MODE=prod         \
    INSTALL_DIR=$pkgdir/usr \
    make install 

    # Install the license.
    #
    install -D -m644 \
       LICENSE       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}