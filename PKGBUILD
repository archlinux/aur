# Maintainer: morguldir <morguldir@protonmail.com>

_pkgname=acquisition
pkgname=acquisition-git
pkgver=0.8b.r6.gbea4121
pkgrel=1
pkgdesc='Inventory management tool for Path of Exile.'
arch=(x86_64)
license=(GPL)
url='https://github.com/xyzz/acquisition'
depends=(qt5-base qt5-webengine)
makedepends=(boost git)
provides=(acquisition)
source=("git+https://github.com/xyzz/acquisition")
sha256sums=(SKIP)

pkgver()
{
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    cd $_pkgname
    qmake && make
}

package()
{
    cd $_pkgname
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "acquisition" "$pkgdir/usr/bin/acquisition"
}
