# Maintainer: xpt <user.xpt@gmail.com>
pkgname=openstudio
pkgver=1.12.0
pkgrel=1
_relvar='ef50b89958'
pkgdesc="Supports whole building energy modeling using EnergyPlus"
arch=('x86_64')
url="https://www.openstudio.net"
depends=('ruby')
# optdep=('energyplus')
license=('LGPL')
source=("https://openstudio-builds.s3.amazonaws.com/$pkgver.$pkgrel/OpenStudio-$pkgver.$pkgrel.$_relvar-Linux.deb" 'patch_desktop.patch')
md5sums=('105897bc6a132f440c1b8931f2e102ec' '5afef8d61b5af033c69a26daa5959508')

package() {
cd "${srcdir}/"
tar Jxvf data.tar.xz -C .
cp -r usr ${pkgdir}

patch -uNp1 ${pkgdir}/usr/share/applications/OpenStudio.desktop ${srcdir}/patch_desktop.patch 

}