# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=2.1.0
pkgrel=1
_relvar='efe91d7516'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://github.com/NREL/OpenStudio/releases/download/$pkgver/OpenStudio-$pkgver.$_relvar-Linux.deb" 'patch_desktop.patch')
md5sums=('1ba248f8a4c350b6dd1511ab110b1740' '5afef8d61b5af033c69a26daa5959508')


package() {
cd "${srcdir}/"
tar Jxvf data.tar.xz -C .
cp -r usr ${pkgdir}

patch -uNp1 ${pkgdir}/usr/share/applications/OpenStudio.desktop ${srcdir}/patch_desktop.patch 

}
