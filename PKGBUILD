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
sha256sums=('d76d59f317c3b8de4a158103ed0175c3dba65bec9b05c56bd7bd28ad48e5519d')


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
