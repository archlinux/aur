# Maintainer:  <alanm@williamson-tn.org>
# Based on pkgbuild found on arch forums by user mpan (https://bbs.archlinux.org/viewtopic.php?id=204222)

pkgname=qstopmotion
pkgver=2.3.2
pkgrel=1
arch=('x86_64')
depends=('ffmpeg' 'gstreamer' 'gphoto2' 'qt4')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/qstopmotion/Version_2_3_2/qstopmotion-2.3.2-Source.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fqstopmotion%2Ffiles%2FVersion_2_3_2%2F&ts=1480219473&use_mirror=pilotfiber")
sha256sums=('2eb3eb956df9cd645a6162a30826a3f5b779dcaefdd5dbc0c3b200e6b9fd71ed')

build() {
    cd code
    hg up v${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
    make
}

package() {
    cd code
    make install
}
