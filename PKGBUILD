# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=3.0.1
pkgrel=1
_relvar='09b7c8a554'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/v$pkgver/OpenStudio-$pkgver+$_relvar-Linux.deb" 'OpenStudio.desktop')
md5sums=('5c71757524dd31490484f6ac5f18ad5e' 'ada86acbe30497d1677139a8ff92188e')


package() {
cd "${srcdir}/"
tar -zxvf data.tar.gz -C .
mkdir -p ${pkgdir}/opt/openstudio/
mkdir -p ${pkgdir}/usr/share/applications

cp -r usr/* ${pkgdir}/opt/openstudio/
cp OpenStudio.desktop ${pkgdir}/usr/share/applications
}

