# Maintainer: kikadf <kikadf.01@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: thacrazze <thacrazze|googlemail|com>

pkgname=clipgrab
pkgver=3.6.5
pkgrel=2
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=('i686' 'x86_64')
url='http://clipgrab.org'
license=('GPL3')
depends=('qtwebkit')
optdepends=('ffmpeg: for the conversion functionality')
source=(https://download.clipgrab.org/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('dd513633d733f4769120e5127586776c'
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
