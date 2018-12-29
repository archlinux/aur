# Maintainer : Daniel Bermond < gmail-com: danielbermond >

pkgname=tiny-dnn
pkgver=1.0.0a3
pkgrel=4
pkgdesc='A C++11 implementation of deep learning for limited computational resource, embedded systems and IoT devices'
arch=('any')
url='https://github.com/tiny-dnn/tiny-dnn/'
license=('BSD')
optdepends=('cereal: for serialization support')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tiny-dnn/tiny-dnn/archive/v${pkgver}.tar.gz")
sha256sums=('e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5175846505aa18b')

build() {
    cd "${pkgname}-${pkgver}"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        .
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
