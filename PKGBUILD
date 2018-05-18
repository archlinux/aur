# Maintainer: Jaryl Chng <mrciku@gmail.com>
pkgname=autopsy
pkgver=4.7.0
pkgrel=1
pkgdesc='The Autopsy Forensic Browser is a GUI for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/autopsy/'
license=('MIT/Apache-2.0')
provides=(autopsy)
depends=(java-runtime testdisk sleuthkit sleuthkit-java)
makedepends=()
source=(https://github.com/sleuthkit/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.zip Autopsy.desktop)
sha256sums=(de85415aef78236f6f135b6ab4376470e60c154f58b867d676bf5b11df40f766 be382bc92f5e98dfebbbf31dc927fc44af0fecee6911f7122ba8e7c55d281262)

package() {
  cd "${pkgname}-${pkgver}"

  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  install -m755 bin/autopsy $pkgdir/usr/bin/autopsy
  cp -r autopsy $pkgdir/usr/
  cp -r docs $pkgdir/usr/
  cp -r etc $pkgdir/usr/
  cp -r gstreamer $pkgdir/usr/
  cp -r harness $pkgdir/usr/
  cp -r java $pkgdir/usr/
  cp -r platform $pkgdir/usr/

  mkdir $pkgdir/usr/share
  mkdir $pkgdir/usr/share/pixmaps
  cp icon.ico $pkgdir/usr/share/pixmaps/autopsy.ico

  mkdir $pkgdir/usr/share/applications
  install -Dm644 ../../Autopsy.desktop $pkgdir/usr/share/applications
}