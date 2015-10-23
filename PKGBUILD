# Maintainer: Alex Amadori <tacchinotacchi@gmail.com>

pkgname=rtbth-dkms
pkgver=3.9.4
pkgrel=3
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
sha256sums=('90224da440e15308d9ef25dcb765400b1471c75c5bb4905e8e6665dd81a571da')

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


