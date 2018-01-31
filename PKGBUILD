# Maintainer:  <alanm@williamson-tn.org>
# Based on pkgbuild found on arch forums by user mpan (https://bbs.archlinux.org/viewtopic.php?id=204222)

pkgname=qstopmotion
pkgver=2.4.0
pkgrel=1
pkgdesc="An application for creating stop-motion animation movies."
url="http://www.qstopmotion.org/"
license=('GPL')
arch=('x86_64')
depends=('ffmpeg' 'gstreamer' 'gphoto2' 'qt4' 'qwt')
makedepends=('cmake')
source=("https://sourceforge.net/projects/qstopmotion/files/Version_2_4_0/qstopmotion-2.4.0-Source.tar.gz/download")
sha256sums=('22672e858673260e985bffb2bdbc03fa9880cc01c63cab6966e3a59cadc17e5d')

build() {
    pwd
    cd qstopmotion-$pkgver-Source/
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
    make
}

package() {
    cd qstopmotion-$pkgver-Source/
    make install
}
