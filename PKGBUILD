# Maintainer: Matthew Stern <msstern98 gmail com>
# Maintainer: Ben Michalowicz <benjaminmichalowicz98 gmail com>

pkgname=topologic-git
pkgbase=topologic-git
pkgver=1.2.0
pkgrel=1
pkgdesc='Library to create dyanimic context free or switching automata'
arch=('any')
url="https://github.com/mstern98/topologic-git"
license=('MIT')
depends=(bison flex)
makedepends=(git)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mstern98/topologic-git/archive/v${pkgver}.tar.gz")
sha256sums=('abd61e03c2cb03492f9f350167cec91e7c5717ffa10bca284a43da2da8048fd7')

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
    cp "$srcdir/${pkgname}-${pkgver}/libtopologic.a" "$pkgdir/usr/lib/"
}
