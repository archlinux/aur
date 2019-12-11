# Maintainer: yakimka <ss.yakim at gmail dot com>
pkgname=cherrytomato
pkgver=0.2.0
pkgrel=1
pkgdesc="Easy to use, flexible PyQt5 Pomodoro Technique timer"
arch=(any)
url="https://github.com/yakimka/CherryTomato"
license=('GPL')
depends=('python-pyqt5' 'python-qroundprogressbar')
makedepends=('python-setuptools')
source=("https://github.com/yakimka/CherryTomato/archive/$pkgver.tar.gz")
sha512sums=('e3602575af555e27852cc2d07bab0e2f12f91194797ff14b653da0990d464908d711ea2890160a59e9c2f7ddf2170ee025b554a953bcec5834a9aa5c369cd69c')

package() {
  cd "$srcdir/CherryTomato-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/applications"
  install --mode=644 --owner=root --group=root "contrib/cherrytomato.desktop" "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons"
  install --mode=644 --owner=root --group=root "CherryTomato/media/icon.png" "$pkgdir/usr/share/icons/cherrytomato.png"
}
