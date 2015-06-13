# Contributor: Thaodan <theodorstormgrade@gmail.com>

pkgname=wargus
pkgver=2.2.7
pkgrel=3
pkgdesc="Warcraft2 Mod that allows you to play Warcraft2 with the Stratagus engine"
arch=("i686" "x86_64")
url="http://wargus.sourceforge.net/"
license=('GPL')
depends=('stratagus=2.2.7' 'ffmpeg2theora' 'cdparanoia' 'timidity++' 'gtk2' )
source=("http://launchpad.net/wargus/trunk/$pkgver/+download/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('115ad5f85d6e6e2078bafb2f95599d6b')
install=wargus.install

build() {
	cd $srcdir/${pkgname}_${pkgver}.orig
	mkdir -p build
	cd build

	cmake .. -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr -DGAMEDIR=/usr/bin
	make 
}

package()  {
        cd $srcdir/${pkgname}_${pkgver}.orig/build
	make  DESTDIR=${pkgdir} install
}

