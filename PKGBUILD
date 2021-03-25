# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=topologic-git
pkgbase=topologic-git
pkgver=1.3.0
pkgrel=1
pkgdesc='Library to create dyanimic context free or switching automata'
arch=('any')
url="https://github.com/mstern98/topologic-git"
license=('MIT')
makedepends=(git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mstern98/topologic-git/archive/v${pkgver}.tar.gz")
sha256sums=('1875dc4c11ad02bf36a18b2e8a3a5da4e814e7792d0d7256e42a1a0c0a3741e9')

build() 
{
    cd "$srcdir/${pkgname}-${pkgver}"
    echo "Starting Build..."
    make
}

package()
{
    mkdir -p "$pkgdir/usr/include"
    mkdir -p "$pkgdir/usr/include/topologic"
    mkdir -p "$pkgdir/usr/lib"
    
    cp "$srcdir/${pkgname}-${pkgver}/include/AVL.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/context.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/edge.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/graph.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/request.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/stack.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/topologic.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/vertex.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/header.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/include/fireable.h" "$pkgdir/usr/include/topologic/"
    cp "$srcdir/${pkgname}-${pkgver}/libtopologic.a" "$pkgdir/usr/lib/"
}
