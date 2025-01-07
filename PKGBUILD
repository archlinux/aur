# Maintainer: Sterophonick
pkgname=agbplay-git
_pkgname='agbplay-git'
pkgbase=agbplay
pkgver=7db9434
pkgrel=2
pkgdesc='Music player for the most common GBA sound format'
url='https://github.com/ipatix/agbplay'
arch=(x86_64 i686 aarch64)
depends=(boost portaudio ncurses5-compat-libs libsndfile jsoncpp)
makedepends=(base-devel)
source=(git+https://github.com/ipatix/agbplay
        agbplay-gui.desktop
        agbplay-gui.png)
md5sums=('SKIP'
         'SKIP'
         'SKIP')
license=('gplv3')

package() {
  mkdir -p $pkgdir/usr/bin
  cd $srcdir/agbplay
  make -j$(nproc)
  cp ./build/src/agbplay-gui/agbplay-gui $pkgdir/usr/bin
  cp ./build/src/agbplay-nc/agbplay-nc $pkgdir/usr/bin

  install -Dm644 sappy2006.desktop $pkgdir/usr/share/applications/agbplay-gui.desktop
  install -Dm644 sappy2006.png $pkgdir/usr/share/pixmaps/agbplay-gui.png
}
