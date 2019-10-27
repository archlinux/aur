# Maintainer: morguldir <morguldir@protonmail.com>

pkgname=acquisition
pkgver=0.8b
pkgrel=1
pkgdesc='Inventory management tool for Path of Exile.'
arch=(x86_64)
license=(GPL)
url='https://github.com/xyzz/acquisition'
depends=(qt5-base qt5-webengine)
makedepends=(boost git)
provides=(acquisition)
source=("git+https://github.com/xyzz/acquisition#tag=$pkgver")
sha256sums=(SKIP)

build()
{
    cd $pkgname
    qmake && make
}

package()
{
    cd $pkgname
    mkdir -p "$pkgdir/usr/bin"
    install -m755 "acquisition" "$pkgdir/usr/bin/acquisition"
}
