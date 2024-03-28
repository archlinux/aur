# Maintainer: frakod <frakod@pm.me>

pkgname='smol_img'
pkgver='v1.3'
pkgrel=1

pkgdesc='Quick Image Editor with automatic resizing to reach target JPG/PNG size.'
arch=(pentium4 i686 x86_64 armv7h aarch64)
url='https://github.com/frak0d/smol_img'
license=('GPL-3.0-only')

depends=(qt5-base)
makedepends=(git cmake)
source=("git+$url")
md5sums=('SKIP')

prepare()
{
    cd $pkgname
git     git checkout $pkgver
}

build()
{
    cd $pkgname
    cmake -S source -B build
    cmake --build build --config Release
}

package()
{
    cmake --install $pkgname/build --prefix $pkgdir/usr
}
