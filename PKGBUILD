# Maintainer: yakimka <ss.yakim at gmail dot com>
pkgname=cherrytomato
pkgver=1.0.0
pkgrel=1
pkgdesc="Easy to use, flexible PyQt5 Pomodoro Technique timer"
arch=(any)
url="https://github.com/yakimka/CherryTomato"
license=('GPL')
depends=('python-pyqt5' 'python-qroundprogressbar' 'qt5-multimedia')
makedepends=('python-setuptools')
source=("https://github.com/yakimka/CherryTomato/archive/$pkgver.tar.gz")
sha512sums=('e8a3b068958dc2dda5774a02ccc4a5acc6923fc0e076a36b7a92787533520b28102a7912b8161f2060a42fbf869bbb079af5c0b44c4dc95b3d8e0f8944f7f012')

package() {
  cd "$srcdir/CherryTomato-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/applications"
  install --mode=644 --owner=root --group=root "contrib/cherrytomato.desktop" "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons"
  install --mode=644 --owner=root --group=root "CherryTomato/media/icon.png" "$pkgdir/usr/share/icons/cherrytomato.png"
}
