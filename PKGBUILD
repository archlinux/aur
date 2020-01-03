# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=2.9.1
pkgrel=1
_relvar='3472e8b799'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/v$pkgver/OpenStudio-$pkgver.$_relvar-Linux.deb" 'OpenStudio.desktop')
md5sums=('dffc748bb70415934478d3829b5b65c3' '9067cc1ba565b4d74112f8cd2da171f8')


package() {
cd "${srcdir}/"
tar -zxvf data.tar.gz -C .
mkdir -p ${pkgdir}/opt/openstudio/
mkdir -p ${pkgdir}/usr/share/applications

cp -r usr/* ${pkgdir}/opt/openstudio/
cp OpenStudio.desktop ${pkgdir}/usr/share/applications
}

