# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alex Amadori <tacchinotacchi@gmail.com>

pkgname=rtbth-dkms
pkgver=3.9.6
pkgrel=1
pkgdesc="rtbth Kernel module sources for Ralink RT3290 bluetooth, lomiu's solution."
arch=('i686' 'x86_64')
url='http://www.mediatek.com/'
license=('mixed')
depends=('dkms')
optdepends=('bluez: Canonical implementation of bluetooth protocol'
'bluez-utils: Utilities for Bluez')
provides=('rtbth')
conflicts=('rtbth-dkms-git')
install='rtbth-dkms.install'
source=("https://github.com/loimu/rtbth-dkms/archive/${pkgver}.tar.gz")
sha512sums=('caea78393365e16a1a8ab163e14710f221dae0f1d132737c4b85da717dc4fcbbe468bcc0f49cb3d75c740c25df2055baeb461878bc2c99d1c16359dabda3d117')

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
mkdir -p "${pkgdir}"/usr/bin
mkdir -p "${pkgdir}"/usr/src
mkdir -p "${pkgdir}"/etc/modprobe.d/
cp -r ./ "${pkgdir}/usr/src/${pkgname}-${pkgver}"
cp tools/rtbt "${pkgdir}"/usr/bin/rtbt
cp tools/ralink-bt.conf "${pkgdir}"/etc/modprobe.d/ralink-bt.conf
}


