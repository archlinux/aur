# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=2.3.0
pkgrel=1
_relvar='cf58ee1e38'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/v$pkgver/OpenStudio-$pkgver.$_relvar-Linux.deb" 'OpenStudio.desktop')
md5sums=('b24b20a6745bb662236f337d236f3f73' '3edac88e1dbdec57dde2baceacf19f39')


package() {
cd "${srcdir}/"
tar -zxvf data.tar.gz -C .
mkdir -p ${pkgdir}/opt/openstudio/
mkdir -p ${pkgdir}/usr/share/applications

cp -r usr/* ${pkgdir}/opt/openstudio/
cp OpenStudio.desktop ${pkgdir}/usr/share/applications
}

