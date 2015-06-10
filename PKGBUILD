# Maintainer: "Jameson Pugh <imntreal@gmail.com"

pkgname=firmware-addon-dell
pkgver=2.2.9
pkgrel=2
pkgdesc="A firmware-tools plugin to handle BIOS/Firmware for Dell systems."
arch=('any')
url="http://linux.dell.com/repo/firmware/"
license=('GPL' 'OSL')
depends=('python2')
source=("http://linux.dell.com/libsmbios/download/firmware-addon-dell/firmware-addon-dell-${pkgver}/firmware-addon-dell-${pkgver}.tar.bz2")
sha256sums=('22b6bab8facbc34531789daf51e08063450a805f17eaad306cc6bcee730b5c02')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
