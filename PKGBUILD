# Maintainer: Em Zhan <zqianem@gmail.com>

pkgname=wgrib
pkgver=1.8.5
pkgrel=2
pkgdesc="Program to manipulate, inventory, and decode GRIB files"
arch=('x86_64')
url="https://www.cpc.ncep.noaa.gov/products/wesley/wgrib.html"
license=('custom')
depends=('glibc')
source=("wgrib.c::https://ftp.cpc.ncep.noaa.gov/wd51we/wgrib/$pkgname.c.v$pkgver"
        "https://ftp.cpc.ncep.noaa.gov/wd51we/wgrib/NOTICE")
sha256sums=('4097d1149d8826756888c7f79688f4f27c64f46cb4bb13a4ff021834bcac2eb6'
            '74d1de582af8663bd77141fc0c241672abeed4cfaa781dc0b9c7b2534a3841ed')

build() {
  gcc wgrib.c --output wgrib
}

package() {
  install -Dm755 wgrib "$pkgdir/usr/bin/wgrib"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
