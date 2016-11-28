# Maintainer:  <alanm@williamson-tn.org>
# Based on pkgbuild found on arch forums by user mpan (https://bbs.archlinux.org/viewtopic.php?id=204222)

pkgname=qstopmotion
pkgver=2.3.2
pkgrel=2
arch=('x86_64')
depends=('ffmpeg' 'gstreamer' 'gphoto2' 'qt4')
makedepends=('cmake')
source=("https://sourceforge.net/projects/qstopmotion/files/Version_2_3_2/qstopmotion-2.3.2-Source.zip/download")
sha256sums=('756d8f85b395c2916957332e33f5f45a4975f384121e3048bda4b158aa7c6bc1')

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
