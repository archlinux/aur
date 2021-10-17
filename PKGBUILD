# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.1.0
pkgrel=1
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://www.cpc.ncep.noaa.gov/products/wesley/wgrib2/"
license=('GPL' 'Apache' 'custom')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran' 'tar')
source=("https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/$pkgname.tgz.v$pkgver")
sha256sums=('5757ef9016b19ae87491918e0853dce2d3616b14f8c42efe3b2f41219c16b78f')

build() {
  cd grib2
  CC=gcc FC=gfortran make
}

package() {
  cd grib2/wgrib2
  install -Dm755 wgrib2 "${pkgdir}/usr/bin/wgrib2"
  install -Dm644 LICENSE-jasper "$pkgdir/usr/share/licenses/$pkgname/LICENSE-jasper"
  install -Dm644 LICENSE-libpng "$pkgdir/usr/share/licenses/$pkgname/LICENSE-libpng"
  install -Dm644 LICENSE-netcdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE-netcdf"
  install -Dm644 LICENSE-wgrib2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-wgrib2"
  install -Dm644 LICENSE-zlib "$pkgdir/usr/share/licenses/$pkgname/LICENSE-zlib"
}
