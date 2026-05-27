# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=adasat
pkgdesc='Implementation of a DPLL-based SAT solver in Ada.'
pkgver=27.0w
pkgrel=1

url=https://github.com/AdaCore/AdaSAT
arch=(i686 x86_64)
license=(Apache)

depends=(gcc-ada)
makedepends=(gprbuild)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/adasat-src.tar.gz)
sha256sums=(f9576c214c980680dc4ef13375b464679679e0de5e3d9770b8e0c2f32d84576f)


build()
{
    cd $srcdir/adasat-27.0w-20260324-1629D-src

    BUILD_MODE=prod \
    make all-libs
}


package()
{
    cd $srcdir/adasat-27.0w-20260324-1629D-src

    BUILD_MODE=prod         \
    INSTALL_DIR=$pkgdir/usr \
    make install 

    # Install the license.
    #
    install -D -m644 \
       LICENSE       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}