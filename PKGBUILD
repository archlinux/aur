# Maintainer: xpt <user.xpt@gmail.com>
pkgname=energyplus
pkgver=8.6.0
pkgrel=1
_relcode='198c6a3cff'
install="$pkgname.install"
pkgdesc="A building energy simulation engine to model energy and water use in buildings"
arch=('x86_64')
url="http://apps1.eere.energy.gov/buildings/energyplus/"
depends=('tar' 'gzip')
# makedepends=('cmake')
license=('GPL')
# source=("https://github.com/NREL/EnergyPlus/archive/v$pkgver.$pkgrel.tar.gz")
# md5sums=('761fc37599eb6e83af0e133472959dd8')
source=("https://github.com/NREL/EnergyPlus/releases/download/v$pkgver/EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh")
md5sums=('0110b083bd4452e2d40f9086c483d26a')

install_script=EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh

package() {
package_name="EnergyPlus-${pkgver/./-}"
install_directory="/opt"
mkdir -p ${pkgdir}${install_directory}
 
cd "${srcdir}/"
tail -n +177 $install_script | gunzip | (cd "${pkgdir}${install_directory}" && tar xf -) 

}
