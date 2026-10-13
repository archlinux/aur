# Maintainer: artemtech <dev@artemtech.id>

_pkgname=vktablet
pkgname=veikk-tablet-bin
pkgver=3.5.10_9
_pkgv=$(echo ${pkgver} | sed 's/_/-/')
pkgrel=1
pkgdesc="Veikk tablet driver retrieved from official veikk website"
arch=("x86_64")
depends=("libx11" "libxrandr" "qt5-base" "libglvnd" "libxi" "glibc" "libusb")
install=veikk-tablet-bin.install
options=(!debug)
url="https://www.veikk.com"
source=("https://macdriver.oss-us-west-1.aliyuncs.com/${_pkgname}-${_pkgv}.${arch}.tar.gz")
md5sums=("ecc3e93577056f46b2c6d6b1fec793fc")

package() {
  cp -r "${srcdir}/${_pkgname}-${_pkgv}.${arch}/etc" "${pkgdir}/etc"
  cp -r "${srcdir}/${_pkgname}-${_pkgv}.${arch}/usr" "${pkgdir}/usr"
  cp -r "${srcdir}/${_pkgname}-${_pkgv}.${arch}/lib" "${pkgdir}/usr"
  find "${pkgdir}/usr/lib/vktablet/conf" -type d -exec chmod 777 {} + 
}

