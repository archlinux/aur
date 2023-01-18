# Maintainer: UmamiAppearance <mail@umamiappearance.eu>

pkgname=pybristol
pkgver=1.0.33
pkgrel=2
pkgdesc='GUI for bristol, based on python3 and tkinter'
arch=('any')
url="https://github.com/adorableGNU/pyBristol"
depends=('python' 'bristol' 'tk')
makedepends=('git')
license=('GPL3')
source=(git+https://github.com/adorableGNU/pyBristol.git)
md5sums=('SKIP')

pkgver() {
  cd pyBristol
  echo ${pkgver%.*}.$(git rev-list --count HEAD)
}

package() {
  mkdir -p $pkgdir/opt/pyBristol
  cp -R $srcdir/pyBristol/gif $pkgdir/opt/pyBristol/
  cp -R $srcdir/pyBristol/doc $pkgdir/opt/pyBristol/
  cp -R $srcdir/pyBristol/icon $pkgdir/opt/pyBristol/
  cp $srcdir/pyBristol/default.conf $pkgdir/opt/pyBristol/
  install -D -m755 $srcdir/pyBristol/pyBristol.py $pkgdir/opt/pyBristol/pyBristol.py
  install -D -m755 $srcdir/pyBristol/pyBristol $pkgdir/usr/bin/pyBristol
  install -D -m644 $srcdir/pyBristol/pyBristol.desktop $pkgdir/usr/share/applications/pyBristol.desktop
  install -D -m644 $srcdir/pyBristol/icon/pyBristol.svg $pkgdir/usr/share/pixmaps/pyBristol.svg
  install -D -m644 $srcdir/pyBristol/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 
