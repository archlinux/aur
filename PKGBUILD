# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=tennis_elbow2013
pkgver=1.0g
pkgrel=1
pkgdesc="tennis game for all tennis lovers"
arch=('x86_64' 'i686')
url="http://www.managames.com/tennis/game_en.html"
license=('commercial')
install=tenniselbow.install
depends_i686=('libcurl-compat')
depends_x86_64=('lib32-libcurl-compat')
md5sums=('c65fe4c86bbb558b477e8924dc712157'
         '2d523ddc828daca9895de69fa0098040'
         'a8b9ec57a3152858b9f30c3f1a3e8efb'
         '7b707060bbedad0ccbcc196fe2306942')

source=('http://www.managames.com/Files/TennisElbow2013-Linux.tar.gz' 'tennis_elbow2013' 'tenniselbow.desktop' 'tenniselbow.png')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/{share,bin}
  cp -r TennisElbow2013 $pkgdir/usr/share
  install -Dm755 $srcdir/tennis_elbow2013 $pkgdir/usr/bin
  install -Dm644 $srcdir/tenniselbow.desktop $pkgdir/usr/share/applications/tenniselbow.desktop
  install -Dm644 $srcdir/tenniselbow.png $pkgdir/usr/share/pixmaps/tenniselbow.png
  cd $pkgdir/usr/share/TennisElbow2013
  chgrp -R games . Tennis.Ini Profiles
  chmod -R g+w . Tennis.Ini Profiles
}
