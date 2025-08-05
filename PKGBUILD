# Maintainer: Sujal Vijayaraghavan <email at sujal dot tv>

pkgname=matlock
pkgver=1.0.0
pkgrel=1
pkgdesc='Screen lock program for X like The Matrix'
arch=('x86_64' 'aarch64')
url="https://git.sujal.tv/tvsujal/matlock"
license=('MIT')
makedepends=('git')
depends=('libxext' 'libxrandr')
source=("https://git.sujal.tv/tvsujal/matlock/-/archive/${pkgver}/${pkgname}-${pkgver}.tar")
sha256sums=('d45a52ce530b9b49977d1f8f6cf13fcac9d295234f57dbff37be3cd56c3557cb')

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
