# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=centroid-rna-package
pkgver=0.0.16
pkgrel=1
pkgdesc="CentroidFold for predicting RNA secondary structures"
arch=('i686' 'x86_64')
url="https://github.com/satoken/centroid-rna-package"
license=('GPL')
depends=('boost-libs>=1.40.0' 'mpfr')
makedepends=('viennarna>=1.8' 'pkgconf')
source=("https://github.com/satoken/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('0978870363a832bb9875c5114e37f79c')

build() {
    cd "$pkgname-$pkgver"
    LIBS=$(pkg-config --libs mpfr) ./configure --prefix=/usr --with-vienna-rna
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
