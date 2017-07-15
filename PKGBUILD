# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=2.2.0
pkgrel=1
_relvar='0a5e9cec3f'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/$pkgver/OpenStudio-$pkgver.$_relvar-Linux.deb" 'patch_desktop.patch')
md5sums=('29928e772f125d48005d6a563424088a' '5afef8d61b5af033c69a26daa5959508')


package() {
cd "${srcdir}/"
tar Jxvf data.tar.xz -C .
cp -r usr ${pkgdir}

patch -uNp1 ${pkgdir}/usr/share/applications/OpenStudio.desktop ${srcdir}/patch_desktop.patch 

}
