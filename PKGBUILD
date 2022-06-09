pkgname=geocrop
pkgver=2.0
pkgrel=1
pkgdesc="Small tool based on GDAL/PROJ4 to automatic crop box on GeoTIFF maps (in most cases - Russians)"
url="https://github.com/h4tr3d/geocrop"
arch=('i686' 'x86_64')
license=('GPL2')
depends=("gdal" "proj")
makedepends=("cmake")
source=("$pkgname-$pkgver.tar.gz::https://github.com/h4tr3d/geocrop/archive/v$pkgver.tar.gz")
md5sums=('9b2463ba4d0bb49f6b1967e2d0ee4cbc')
 
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
