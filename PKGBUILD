# Maintainer: Sujal Vijayaraghavan <email at sujal dot tv>


pkgname=matlock
pkgver=1.0.0
pkgrel=1
pkgdesc='Screen lock program for X like The Matrix'
arch=('x86_64' 'aarch64')
url="https://gitlab.sujal.tv/tvsujal/matlock"
license=('MIT')
makedepends=('git')
depends=('libxext' 'libxrandr')
source=("http://gitlab.sujal.tv/tvsujal/matlock/-/archive/${pkgver}/${pkgname}-${pkgver}.tar")
sha256sums=('24e3dd74d39a70075ea17ee479b4203b3853472c7ec86aec39e7cf0d7d3f4275')


build() {
    rm -rf ${pkgname}
    tar xf ${pkgname}-${pkgver}.tar --one-top-level=$pkgname --strip-components=1
    cd ${pkgname}
    make
}


package() {
    cd $pkgname
    make PREFIX=/usr DESTDIR="$pkgdir" instal
    install -m 644 -D LICENCE "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
}
