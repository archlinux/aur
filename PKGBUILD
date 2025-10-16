# Maintainer: Marc Rechté <marc4@rechte.fr>
pkgname='zlog'
pkgver='1.2.18'
pkgrel=1
pkgdesc='A reliable pure C logging library.'
arch=('x86_64')
url='https://hardysimpson.github.io/zlog/'
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HardySimpson/zlog/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('5f99a30e61af3b62db4986e277f69cf9')
options=('staticlibs')
install=$pkgname.install

build() {
    cd "$pkgname-${pkgver}"
    make
}

package() {
    cd "$pkgname-${pkgver}"
    make PREFIX="$pkgdir/usr/" install
    install src/libzlog.a "$pkgdir/usr/lib"
}
