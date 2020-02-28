# Maintainer: yakimka <ss.yakim at gmail dot com>
pkgname=cherrytomato
pkgver=0.5.0
pkgrel=1
pkgdesc="Easy to use, flexible PyQt5 Pomodoro Technique timer"
arch=(any)
url="https://github.com/yakimka/CherryTomato"
license=('GPL')
depends=('python-pyqt5' 'python-qroundprogressbar' 'qt5-multimedia')
makedepends=('python-setuptools')
source=("https://github.com/yakimka/CherryTomato/archive/$pkgver.tar.gz")
sha512sums=('9581b445d4b8fa82eeaffb0467361a4986794a2dd81bd7f0e66cccd465c718531dfbedd6e271b7682258eb0bb69f3651ebc0d7c43f8ca2d66c1d771b50d9ec4e')

package() {
  cd "$srcdir/CherryTomato-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/applications"
  install --mode=644 --owner=root --group=root "contrib/cherrytomato.desktop" "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons"
  install --mode=644 --owner=root --group=root "CherryTomato/media/icon.png" "$pkgdir/usr/share/icons/cherrytomato.png"
}
