# Maintainer: André Klitzing <aklitzing () gmail () com>

pkgname=persosim_driver
pkgver=20150112
pkgrel=1
pkgdesc='Der Open Source Simulator für den elektronischen Personalausweis'
arch=('i686' 'x86_64')
url='http://www.persosim.de'
license=('GPL3')
depends=('pcsclite' 'pcsc-tools')
source=("http://www.persosim.de/sites/default/files/PersoSim_Driver_Linux_${pkgver}.tgz" Makefile.patch)

prepare()
{
	cd "de.persosim.driver.linux"
	patch -p0 -i $srcdir/Makefile.patch
}

build()
{
	cd "de.persosim.driver.linux"
	make
}

package()
{
	cd "de.persosim.driver.linux"
	make PREFIX="$pkgdir" install
}

sha256sums=('b5d7a6692bce1b8a4f242a402716057f372b20a1ef551e0f9596817f4bac8637'
            '3b57979a88ee9846436a50263c8cb7975a99830ef8e666aa4dce6c4d35f45997')
