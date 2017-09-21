# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=2.2.0
pkgrel=2
_relvar='0a5e9cec3f'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/v$pkgver/OpenStudio-$pkgver.$_relvar-Linux.deb" 'OpenStudio.desktop')
md5sums=('29928e772f125d48005d6a563424088a' '98bb96765a138f978e3cd780d571757a')


package() {
cd "${srcdir}/"
tar -zxvf data.tar.gz -C .
mkdir -p ${pkgdir}/opt/openstudio/
mkdir -p ${pkgdir}/usr/share/applications

cp -r usr/* ${pkgdir}/opt/openstudio/
cp OpenStudio.desktop ${pkgdir}/usr/share/applications
}

