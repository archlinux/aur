# Maintainer: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: GrbavaCigla <alexa.ognjanovic at gmail dot com>
# Contributor: hawerner 
pkgname=pureref
pkgver=1.10.4
pkgrel=2
pkgdesc="Reference Image Viewer"
arch=('x86_64')
url="http://www.pureref.com"
license=('unknown')
makedepends=('curl' 'libarchive' 'binutils')
options=(!strip)
source=("${pkgname}-${pkgver}.deb::https://www.pureref.com/files/build.php?build=LINUX64.deb&downloadKey=$(curl https://www.pureref.com/download.php 0>/dev/null | grep var\ key | cut -d "\"" -f2)")
sha512sums=('0ef67c7e38a8dc2707134802ac413fc1503cb633640f2dbf6164e17a104283d0d98ebb52ef9b7c75342ceb0094b527845ccbd9dcadf5dca7ab06140593763e90')

prepare(){
	ar x "${pkgname}-${pkgver}.deb"
}

package(){
	tar xfv data.tar.xz -C "${pkgdir}"
	chmod -R 755 "${pkgdir}"
}
