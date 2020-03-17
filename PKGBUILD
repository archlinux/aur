# Maintainer: n3e <n3e at thathat dot net>

pkgname=perccli
pkgver=7.1_007.0127
pkgrel=1
pkgdesc='Proprietary controller binary for DELL PERC RAID cards.'
url='https://www.dell.com/support/home/us/en/04/drivers/driversdetails?driverid=f48c2'
arch=(x86_64)

license=('GPL')

makedepends=(
  rpmextract
)
source=(
  https://dl.dell.com/FOLDER04470715M/1/perccli_${pkgver//_/-}_linux.tar.gz
)
sha256sums=(
  9cf8080a60cc8b45002d86762b0a7bd869b15ade94777d29ac838c72098cedb7
)

prepare() {
  /usr/bin/true
}

build() {
  cd ./Linux
  rpmextract.sh perccli-*.rpm
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin"
  cp -a ./Linux/opt "${pkgdir}"
  ln -s "/opt/MegaRAID/perccli/perccli64" ${pkgdir}/usr/bin/perccli
}

