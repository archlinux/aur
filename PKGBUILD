# Maintainer: Jack Kamm <jackkamm@gmail.com>
pkgname=pantum-p2000-driver
pkgver="1.00_1"
pkgrel=1
pkgdesc="Pantum 2000 Series Linux Driver"
arrch=('x86_64')
url="http://global.pantum.com/global/"
license=('proprietary')
depends=('cups')
makedepends=('rpmextract' 'unzip')
source=(
  "http://global.pantum.com/global/wp-content/uploads/2016/01/Pantum-P2000-Series-Linux-DriverUbutun12.04V1.00-1.zip"
)
md5sums=('0024556a55eacef3d63ed4478ea1490d')

build() {
  cd $srcdir

  unzip Pantum-P2000-Series-Linux-DriverUbutun12.04V1.00-1.zip
  # rename unzipped directory, otherwise rpm2cpio breaks
  mv ' Pantum 2000 Series Linux Driver (Ubutun12.04) V1.00' Pantum-P2000-Series-Linux-DriverUbutun12.04V1.00-1

  mkdir -p ${pkgname}-${pkgver}
  cd ./${pkgname}-${pkgver}

  rpm2cpio "../Pantum-P2000-Series-Linux-DriverUbutun12.04V1.00-1/Pantum-0.3-1.${arch}.rpm" | bsdtar -xf -
}

package() {
  cd ${pkgdir}
  cp -a ${srcdir}/${pkgname}-${pkgver}/* .
}

# vim:set ts=2 sw=2 et:
