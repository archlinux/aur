# Maintainer: xpt <user.xpt@gmail.com>
pkgname=energyplus
pkgver=9.0.1
pkgrel=1
_relcode='bb7ca4f0da'
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
md5sums=('d393c99b3a160e1b0cc1371e4786362e')

install_script=EnergyPlus-$pkgver-$_relcode-Linux-x86_64.sh

package() {
package_name="EnergyPlus-${pkgver/./-}"
install_directory="/opt"
mkdir -p ${pkgdir}${install_directory}
 
cd "${srcdir}/"
tail -n +163 $install_script | gunzip | (cd "${pkgdir}${install_directory}" && tar xf -) 

}
