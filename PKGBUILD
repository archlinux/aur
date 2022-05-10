# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=sts
pkgver=3.2.6
pkgrel=1
pkgdesc="Improved version of the NIST Statistical Test Suite (STS)"
url="https://github.com/arcetri/sts"
arch=('x86_64')
license=('custom:public-domain')
depends=('fftw')
source=("https://github.com/arcetri/$pkgname/archive/refs/tags/$pkgver.tar.gz")
b2sums=("050904c4ece877441cab089e24a6392dedf42d8d00360dc7cb5777b5eb2e6edaaaa586153b7a80d1c8e6c706037e7234114db017da9d93916d2d5539dedcae7c")

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTBINDIR="${pkgdir}/usr/bin" install
}
