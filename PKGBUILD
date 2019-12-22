# Maintainer: PSposito <http://bit.do/linuxer> 
# 			<https://gitlab.com/psposito>
# Contributor: http://agelospanagiotakis.blogspot.gr/2009/07/gambas-basic-linux.html

pkgname=gambas3-eortologioqt5
_realname=EortologioQt5-1.0.10
pkgdesc="Ελληνικό Εορτολόγιο - Greek Feasts Calendar"
pkgver=1.0.10
pkgrel=1
pkgbase=gambas3-eortologioqt5
arch=('any')
url="https://gitlab.com/psposito/EortologioGambas3"
license=('GPL3')
depends=('gambas3-gb-image>=3.14' 'gambas3-gb-image<=3.99.0' 'gambas3-gb-qt5>=3.14' 'gambas3-gb-qt5<=3.99.0' 'gambas3-gb-form>=3.14' 'gambas3-gb-form<=3.99.0' 
	'gambas3-gb-db>=3.14' 'gambas3-gb-db<=3.99.0' 'gambas3-gb-dbus>=3.14' 'gambas3-gb-dbus<=3.99.0' 'gambas3-gb-qt5>=3' 'gambas3-gb-form>=3' 
	'gambas3-gb-image>=3' 'gambas3-runtime>=3' 'gambas3-devel>=3' 'gambas3-gb-db-sqlite3>=3.14')
makedepend=('gambas3-devel')
source=(https://gitlab.com/psposito/EortologioGambas3/uploads/aa195ffda0e36ef7c5734319f45df469/EortologioQt5-1.0.10.tar.bz2)

sha256sums=('b65caa763efbc9931c7834ae12a5810c49cc17c2c38adb9ab814336bbcb6a60b')

build() {
  cd "$srcdir/$_realname/"

  /usr/bin/gbc3 -e -a -g -t -x  && gba3
}

package() {
  cd "$srcdir/$_realname/"
  pwd

  install -d "$pkgdir/usr/bin"
  install -m755 EortologioQt5-1.0.10.gambas "$pkgdir/usr/bin/EortologioQt5"
  ln -s "EortologioQt5" "$pkgdir/usr/bin/gambas3-eortologioqt5"
  install -D "EortologioQt5.png" "$pkgdir/usr/share/pixmaps/EortologioQt5.png"
  install -D "gambas3-eortologioqt5.desktop" "$pkgdir/usr/share/applications/gambas3-eortologioqt5.desktop"
  install -d "$pkgdir/usr/share/EortologioQt5/" 
  install -d "$pkgdir/usr/share/pixmaps/"
  install -d "$pkgdir/usr/share/icons/gnome/scalable/apps/"
  install -d "$pkgdir/usr/share/icons/"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -p "$srcdir/${_realname}/.hidden/eortes.dat" "$pkgdir/usr/share/EortologioQt5/eortes.dat"
  install -p "$srcdir/${_realname}/.hidden/EortologioQt5.1.0.png" "$pkgdir/usr/share/pixmaps/EortologioQt5.1.0.png"
  install -p "$srcdir/${_realname}/.hidden/EortologioQt5.1.0.svg" "$pkgdir/usr/share/icons/gnome/scalable/apps/EortologioQt5.1.0.svg"
  install -p "$srcdir/${_realname}/.hidden/EortologioQt5.1.0.png" "$pkgdir/usr/share/icons/EortologioQt5.1.0.png"
  install -p "$srcdir/${_realname}/.hidden/EortologioQt5.1.0.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/EortologioQt5.1.0.svg"
}
