# Maintainer: kikadf <kikadf.01@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: thacrazze <thacrazze|googlemail|com>

pkgname=clipgrab
pkgver=3.6.9
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=('i686' 'x86_64')
url='http://clipgrab.org'
license=('GPL3')
depends=('qtwebkit')
optdepends=('ffmpeg: for the conversion functionality')
source=(https://download.clipgrab.org/$pkgname-$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('c11aebd9dfd61465484868566bd3a9e6'
         '9a141791f6952917c441050c3dac81ce')

build() {
  cd $pkgname-$pkgver

  qmake-qt4 clipgrab.pro
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
