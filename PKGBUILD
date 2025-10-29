# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt-bin
_pkgname=photoqt
pkgver=4.9.2
pkgrel=2
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface (binary release)"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt' 'photoqt-debug')
provides=('photoqt' 'photoqt-bin-debug')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'qt6-location' 'qt6-positioning' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'pugixml' 'mpv' 'resvg' 'python-pychromecast' 'qt6-webengine' 'zxing-cpp' 'lcms2' 'devil')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
source=(https://photoqt.org/downloads/bin/$_pkgname-$pkgver-1.tar.gz)
sha256sums=('08379377ced17c593dada02f20e8054ddb008c0d2609ceb8166601fa32caf814')

package() {

  cd $srcdir/$_pkgname-$pkgver

  # install binary
  install -Dm0755 -t "$pkgdir/usr/bin/" photoqt

  # install desktop file
  install -Dm0644 -t "$pkgdir/usr/share/applications/" org.photoqt.PhotoQt.desktop

  # install metainfo
  install -Dm0644 -t "$pkgdir/usr/share/metainfo/" org.photoqt.PhotoQt.metainfo.xml

  # install icons
  for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$size/apps" "icons/$size/org.photoqt.PhotoQt.png"
  done

}
