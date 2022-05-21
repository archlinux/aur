# Maintainer: Luke Bryan <luke@hearham.live>

pkgname=repeater-start
pkgver=0.8
pkgrel=1
pkgdesc="Repeater-START (Showing The Amateur Repeaters Tool) is an app to view nearby ham radio repeaters."
arch=('any')
url="http://sourceforge.net/projects/repeater-start/"
options=('!strip')

source=("https://sourceforge.net/projects/$pkgname/files/${pkgname}_${pkgver}_all.deb")
sha256sums=('fef1df7619efc6ed1e574d66bbca90a7862acf0c2fd8f3a2b86759f1791be993')

depends=("python3" "python-gobject" "osm-gps-map" "geoclue")

package() {
  tar xvfJ data.tar.xz
  mkdir -p $pkgdir/usr/share
  cd $srcdir/usr
  rm -Rf share/doc
  cd $srcdir/usr/share/repeater-START/
  cd $srcdir
  cp -r usr $pkgdir
  chmod -R 755 $pkgdir/usr/bin/repeaterSTART
  chmod -R 755 $pkgdir/usr/share/applications/repeaterstart.desktop
  chmod -R 755 $pkgdir/usr/share/repeater-START
}

