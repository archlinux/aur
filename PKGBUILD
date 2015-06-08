# Author: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>
# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=food_gui
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple calculator, that calculates proteins, fats, carbohydrates, food energy and glycemic index"
arch=('i686' 'x86_64')
url="https://github.com/arcan1s/food_gui"
license=('GPL')
depends=('python2-pyqt4')
source=(https://github.com/arcan1s/food_gui/releases/download/V.${pkgver}/${pkgname}-${pkgver}-src.zip)
md5sums=('f4f6df25131af05ae4ec8b03936cedc9')

package()
{
  install -D -m755 "${srcdir}/usr/bin/food_gui.sh" "${pkgdir}/usr/bin/food_gui"
  python2 setup.py install --root="${pkgdir}"
  install -D -m644 "${srcdir}/usr/share/applications/food_gui.desktop" \
                   "${pkgdir}/usr/share/applications/food_gui.desktop"
  install -D -m644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/food_gui.png" \
                   "${pkgdir}/usr/share/icons/hicolor/32x32/apps/food_gui.png"
  install -D -m644 "${srcdir}/usr/share/pixmaps/food_gui.png" "${pkgdir}/usr/share/pixmaps/food_gui.png"
  
  install -D -m644 "${srcdir}/usr/share/food_gui/db_eng.dat" "${pkgdir}/usr/share/food_gui/db_eng.dat"
  install -D -m644 "${srcdir}/usr/share/food_gui/db_rus.dat" "${pkgdir}/usr/share/food_gui/db_rus.dat"
  
  install -D -m644 "${srcdir}/usr/share/man/man1/food_gui.1" "${pkgdir}/usr/share/man/man1/food_gui.1"
}
