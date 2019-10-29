# Maintainer: Jake Barnes <me@jakebarn.es>
pkgname=input-redirection-client-qt
pkgver=2.1
pkgrel=1
pkgdesc="Input redirection client for the 3DS using QtGamepad"
arch=('x86_64')
url="https://github.com/TuxSH/InputRedirectionClient-Qt"
license=('MIT')
provides=('input-redirection-client-qt')
conflicts=('input-redirection-client-qt-git')
depends=('qt5-base' 'qt5-gamepad')
source=("https://github.com/TuxSH/InputRedirectionClient-Qt/archive/v$pkgver.tar.gz"
        "input-redirection-client-qt.desktop")
md5sums=('180ab0c1663222fae3770dd2f4654ac1'
         'a2ca494c5c1b38ac77ee9f44d586c89a')

build() {
  cd "$srcdir/InputRedirectionClient-Qt-$pkgver"
  qmake
  make
}

package() {
  install -Dm 755 "$srcdir/InputRedirectionClient-Qt-$pkgver/InputRedirectionClient-Qt" "$pkgdir/usr/bin/input-redirection-client-qt"
  install -Dm 644 "$srcdir/input-redirection-client-qt.desktop" "$pkgdir/usr/share/applications/input-redirection-client-qt.desktop"
}
