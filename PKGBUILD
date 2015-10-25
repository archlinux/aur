# Maintainer: Alex Amadori <tacchinotacchi@gmail.com>

pkgname=rtbth-dkms
pkgver=3.9.4.1
pkgrel=1
pkgdesc="rtbth Kernel module sources for Ralink RT3290 bluetooth"
arch=('i686' 'x86_64')
url='http://www.mediatek.com/'
license=('mixed')
depends=('dkms')
optdepends=('bluez: Canonical implementation of bluetooth protocol'
'bluez-utils: Utilities for Bluez')
provides=('rtbth')
install='rtbth-dkms.install'
source=("https://github.com/f1u77y/rtbth-dkms-aur/archive/${pkgver}.tar.gz")
md5sums=('740a7aed7439cc4a94f8132bbd6e49eb')

prepare() {
cd ${srcdir}
tar -xf "${pkgver}".tar.gz
cd "${provides}-${pkgver}"
}

package() {
cd "${srcdir}/${provides}-${pkgver}"
mkdir -p "${pkgdir}"/usr/bin
mkdir -p "${pkgdir}"/usr/src
mkdir -p "${pkgdir}"/etc/modprobe.d/
cp -r ./ "${pkgdir}/usr/src/${provides}-${pkgver}"
cp tools/rtbt "${pkgdir}"/usr/bin/rtbt
cp tools/ralink-bt.conf "${pkgdir}"/etc/modprobe.d/ralink-bt.conf
}


