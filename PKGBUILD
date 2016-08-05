# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=geocrop
pkgver=1.0
pkgrel=1
pkgdesc="Small tool based on GDAL/PROJ4 to automatic crop box on GeoTIFF maps (in most cases - Russians)"
url="https://github.com/h4tr3d/geocrop"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("gdal" "proj")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/h4tr3d/geocrop/archive/v$pkgver.tar.gz")
md5sums=('bf4b47787e71b9df2f33c2c1ed5eb8ed')
 
build() {
    cd ${pkgname}-${pkgver}
    [[ -d build ]] || mkdir build
    cd build
    cmake ..
    make
}

package() {
    install -Dm755 "$srcdir/${pkgname}-${pkgver}/build/geocrop" "$pkgdir/usr/bin/geocrop"
}
