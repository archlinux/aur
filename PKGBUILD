# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=2.7.1
pkgrel=1
_relvar='b8d47b8b9d'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/v$pkgver/OpenStudio-$pkgver.$_relvar-Linux.deb" 'OpenStudio.desktop')
md5sums=('ff1c11726aba58899b140ff68d11421b' '3edac88e1dbdec57dde2baceacf19f39')

package() {
cd "${srcdir}/"
tar -zxvf data.tar.gz -C .
mkdir -p ${pkgdir}/opt/openstudio/
mkdir -p ${pkgdir}/usr/share/applications

cp -r usr/* ${pkgdir}/opt/openstudio/
cp OpenStudio.desktop ${pkgdir}/usr/share/applications
}

