# Maintainer:  n3e <n3e at thathat dot net>
# Contributor: BStrauss3 <bstrauss at acm dot org>

pkgname=perccli
pkgver=7.3_007.0318
pkgrel=0
pkgdesc='Proprietary controller binary for DELL PERC RAID cards.'
url='https://www.dell.com/support/home/us/en/04/drivers/driversdetails?driverid=f48c2'
arch=(x86_64)

license=('GPL')

makedepends=(
  rpmextract
)
source=(
  https://dl.dell.com/FOLDER04830419M/1/perccli_${pkgver//_/-}_linux.tar.gz
)
sha256sums=(
  8c37be8c2a2ccd4fb013362b9b772807e05d65f17bcbb773002098dab8ee1c93
)

prepare() {
  /usr/bin/true
}

build() {
  cd ./perccli_7.3-007.0318_linux/Linux
  rpmextract.sh perccli-*.rpm
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin"
  cp -a ./perccli_7.3-007.0318_linux/Linux/opt "${pkgdir}"
  ln -s "/opt/MegaRAID/perccli/perccli64" ${pkgdir}/usr/bin/perccli
}

