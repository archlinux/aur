# Maintainer: yakimka <ss.yakim at gmail dot com>
pkgname=cherrytomato
pkgver=1.1.0
pkgrel=1
pkgdesc="Easy to use, flexible PyQt5 Pomodoro Technique timer"
arch=(any)
url="https://github.com/yakimka/CherryTomato"
license=('GPL')
depends=('python-pyqt5' 'python-qroundprogressbar' 'qt5-multimedia')
makedepends=('python-setuptools')
source=("https://github.com/yakimka/CherryTomato/archive/$pkgver.tar.gz")
sha512sums=('9021c329c69635e3ec6990f54451077a3c8982f984ffb00a12ab6e6070f38b5ce76145e73397ba00016fd10ed546272e41773bbc1eadea71187dfa8d456de67e')

package() {
  cd "$srcdir/CherryTomato-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/applications"
  install --mode=644 --owner=root --group=root "contrib/cherrytomato.desktop" "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons"
  install --mode=644 --owner=root --group=root "CherryTomato/media/icon.png" "$pkgdir/usr/share/icons/cherrytomato.png"
}
