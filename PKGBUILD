# Maintainer: Amiad Bareli <amiadb at gmail dot com>
# Last Contributor: amiad
pkgname=behafucha
pkgver=0.7
pkgrel=6
pkgdesc="Convert English/Hebrew text to Hebrew/English text"
arch=('i686' 'x86_64')
url="https://github.com/ilsh1964/behafucha/"
license=('GPL')
depends=(bc zenity pygtk xsel xvkbd)
source=(https://github.com/ilsh1964/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('75d3598b0dc64ec17ddd8c6216e0c33c3922cef2f07259a0c95db026556ae20f')

build() {
  cd $srcdir/Behafucha-$pkgver/Source/
  sed -i '1c#!/usr/bin/python2' Behafucha.py
  sed -i '3c python2 /usr/lib/Behafucha/Behafucha.py' $pkgname
  install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm 644 Behafucha.py $pkgdir/usr/lib/Behafucha/Behafucha.py
  install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm 644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

