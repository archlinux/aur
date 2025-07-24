# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=markdown
pkgdesc='A markdown parser for Ada.'
pkgver=26.0w
pkgrel=1

url=https://github.com/AdaCore/markdown
arch=(i686 x86_64)
license=(Apache)

depends=(libvss)
makedepends=(gprbuild-toolbox)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/markdown-26.0w-20250417-1614C-src.tar.gz)
sha256sums=(55b7f37fcf1d16c40586a781e4dec319acafc1a75b1f43c19e7b6a96cf10c553)


build()
{
    cd $srcdir/markdown-26.0w-20250417-1614C-src
    BUILD_MODE=prod make all
}


package()
{
    cd $srcdir/markdown-26.0w-20250417-1614C-src

    make BUILD_MODE=prod \
         DESTDIR=$pkgdir \
         install
    
    # Install the licenses.
    #
    install -D -m644     \
       LICENSE.txt       \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
}