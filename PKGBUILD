# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Contributor: Beej Jorgensen <beej@beej.us>

pkgname=fann
pkgver=2.2.0
pkgrel=5
pkgdesc='Fast artificial neural network library'
url='http://leenissen.dk/fann/'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/libfann/fann/archive/${pkgver}.tar.gz")
sha256sums=('f31c92c1589996f97d855939b37293478ac03d24b4e1c08ff21e0bd093449c3c')

build() {
    cd "${pkgname}-${pkgver}"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev \
        .
        
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
}
