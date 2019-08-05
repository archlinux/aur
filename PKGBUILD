# Maintainer:  <alanm@williamson-tn.org>
# Based on pkgbuild found on arch forums by user mpan (https://bbs.archlinux.org/viewtopic.php?id=204222)

pkgname=qstopmotion
pkgver=2.4.1
pkgrel=1
pkgdesc="An application for creating stop-motion animation movies."
url="http://www.qstopmotion.org/"
license=('GPL')
arch=('x86_64')
depends=('ffmpeg' 'gstreamer' 'gphoto2' 'qt5-base' 'qwt')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/project/qstopmotion/Version_2_4_1/qstopmotion-2.4.1-Source.tar.gz")
sha256sums=('90be482401e7043a68089d216aa149d59d7ac4b4e82ce1f516532d807d97260f')

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
