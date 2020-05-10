# Maintainer: Fatih Bostancı <ironic@yaani.com>

pkgname=ezanvakti-qt-gui
pkgver=1.1
pkgrel=1
pkgdesc="Qt Gui for Ezanvakti Application"
arch=('x86_64')
url="https://gitlab.com/fbostanci/ezanvakti-qt-gui"
license=('GPL3')
depends=('ezanvakti>=7.0' 'qt5-base' 'qt5-multimedia' 'gst-plugins-good')
source=("https://github.com/fbostanci/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('7c184433cacae537dfdb2d0f259546be')

build() {
    cd "$pkgname-$pkgver"
    qmake $pkgname.pro
    make
}

package() {
  cd "$pkgname-$pkgver"
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -D -m644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
