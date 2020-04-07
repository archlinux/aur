# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>

pkgname=wiiload
pkgver=0.5.1
pkgrel=2
pkgdesc='Load homebrew apps over network/usbgecko to your Wii'
arch=('i686' 'x86_64')
url='http://hbc.hackmii.com/'
license=('GPL2')
depends=('zlib')
source=("https://github.com/devkitPro/wiiload/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('83217d819a60ea09bd395752289324c767be2438226f0d155845cacd289a9595')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir/" make install
}
