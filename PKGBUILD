# Maintainer:  <alanm@williamson-tn.org>
# Based on pkgbuild found on arch forums by user mpan (https://bbs.archlinux.org/viewtopic.php?id=204222)

pkgname=qstopmotion
pkgver=2.5.0
pkgrel=1
pkgdesc="An application for creating stop-motion animation movies."
url="http://www.qstopmotion.org/"
license=('GPL')
arch=('x86_64')
depends=('ffmpeg' 'gstreamer' 'gphoto2' 'qt5-base' 'qwt' 'qt5-multimedia')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/project/qstopmotion/Version_2_5_0/qstopmotion-2.5.0-Source.tar.gz")
md5sums=('ff0bb2e213928c5355b948f7cabcb104')

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
