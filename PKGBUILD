# Maintainer: yakimka <ss.yakim at gmail dot com>
pkgname=cherrytomato
pkgver=0.4.1
pkgrel=1
pkgdesc="Easy to use, flexible PyQt5 Pomodoro Technique timer"
arch=(any)
url="https://github.com/yakimka/CherryTomato"
license=('GPL')
depends=('python-pyqt5' 'python-qroundprogressbar')
makedepends=('python-setuptools')
source=("https://github.com/yakimka/CherryTomato/archive/$pkgver.tar.gz")
sha512sums=('b03cfc1e92e17199f9d086c9b7faba0bd60a67c7b89fe557485bea13eb24f004f57f2af7bd55e68ae1bc143dbc078537b2b86cf8d1b283d7dd722a36549b1a58')

package() {
  cd "$srcdir/CherryTomato-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/applications"
  install --mode=644 --owner=root --group=root "contrib/cherrytomato.desktop" "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons"
  install --mode=644 --owner=root --group=root "CherryTomato/media/icon.png" "$pkgdir/usr/share/icons/cherrytomato.png"
}
