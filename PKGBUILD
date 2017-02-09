# $Id: PKGBUILD 209603 2017-01-31 21:01:48Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: thacrazze <thacrazze|googlemail|com>

pkgname=clipgrab
pkgver=3.6.3
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=(i686 x86_64)
url='http://clipgrab.org'
license=(GPL3)
depends=(qt5-webkit)
optdepends=('ffmpeg: for the conversion functionality')
source=(https://download.clipgrab.org/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('0e7d9dd854eebbaf55d53e9243819125'
         '9a141791f6952917c441050c3dac81ce')

build() {
  cd $pkgname-$pkgver

  qmake clipgrab.pro
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
