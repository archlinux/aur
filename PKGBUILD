# Maintainer: Luke Bryan <luke@hearham.live>

pkgname=repeater-start
pkgver=1.0.1
pkgrel=1
pkgdesc="Repeater-START (Showing The Amateur Repeaters Tool) is an app to view nearby ham radio repeaters."
arch=('any')
url="http://sourceforge.net/projects/repeater-start/"
options=('!strip')

source=("https://sourceforge.net/projects/$pkgname/files/${pkgname}_${pkgver}_all.deb")
sha256sums=('46559b1e6ff0d416278a0f7556a91ed4814ac26cd12c0b63fc05033ee3a96126')

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

