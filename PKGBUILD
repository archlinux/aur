# Maintainer:  <alanm@williamson-tn.org>
# Based on pkgbuild found on arch forums by user mpan (https://bbs.archlinux.org/viewtopic.php?id=204222)

pkgname=qstopmotion
pkgver=2.3.2
pkgrel=1
arch=('x86_64')
depends=('ffmpeg' 'gstreamer' 'gphoto2' 'qt4')
makedepends=('cmake' 'mercurial')
source=('hg+http://hg.code.sf.net/p/qstopmotion/code')
sha256sums=('SKIP')

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
