# Contributor: kirigaya <kirigaya@mkacg.com>

pkgbase=gbyzanz
pkgname=gbyzanz
pkgver=20160221
pkgrel=1
pkgdesc="gbyzanz"
arch=('any')
license=('GPLv3')
url='https://github.com/Match-Yang/Gbyzanz.git'
depends=('qt5-base' 'qml-material')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/Match-Yang/Gbyzanz.git')
md5sums=('SKIP')

pkgver(){
  cd  "$srcdir/$pkgname/"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}
package(){
  cd  "$srcdir/$pkgname/"
  mkdir build
  cd build
  qmake ..
  make
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname/build/gbyzanz" "$pkgdir/usr/bin/"
  cp "$srcdir/$pkgname/gbyzanz.desktop" "$pkgdir/usr/share/applications/"
}
