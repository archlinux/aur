# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>

pkgname=wiiload
pkgver=0.5.1
pkgrel=1
pkgdesc='Load homebrew apps over network/usbgecko to your Wii'
arch=('i686' 'x86_64')
url='http://hbc.hackmii.com/'
license=('GPL2')
depends=('zlib')
source=("http://sourceforge.net/projects/devkitpro/files/sources/tools/$pkgname-$pkgver.tar.bz2")
sha256sums=('95557ecae364d189fb771702af56c1c6f9ee076696046b78e7a2e931974533cc')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir/" make install
}
