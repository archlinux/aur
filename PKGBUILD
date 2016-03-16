# Maintainer: xpt <user.xpt@gmail.com>
pkgname=energyplus
pkgver=8.4.0
pkgrel=1
_relcode='09f5359d8a'
install="$pkgname.install"
pkgdesc="A building energy simulation engine to model energy and water use in buildings"
arch=('x86_64')
url="http://apps1.eere.energy.gov/buildings/energyplus/"
depends=('tar' 'gzip')
# makedepends=('cmake')
license=('GPL')
# source=("https://github.com/NREL/EnergyPlus/archive/v$pkgver.$pkgrel.tar.gz")
# md5sums=('761fc37599eb6e83af0e133472959dd8')
source=("https://github.com/NREL/EnergyPlus/releases/download/v$pkgver.$pkgrel/EnergyPlus-$pkgver.$pkgrel-$_relcode-Linux-x86_64.sh")
md5sums=('198a74169b5127379d33cc7002350f1e')

install_script=EnergyPlus-$pkgver.$pkgrel-$_relcode-Linux-x86_64.sh

package() {
package_name="EnergyPlus-${pkgver/./-}-$pkgrel"
install_directory="/opt"
mkdir -p ${pkgdir}${install_directory}
 
cd "${srcdir}/"
tail -n +177 $install_script | gunzip | (cd "${pkgdir}${install_directory}" && tar xf -) 

}