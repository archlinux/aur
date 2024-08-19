# Maintainer: ayeitsharry <ayeitsharry@proton.me>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>

pkgname=wiiload
pkgver=0.5.3
pkgrel=2
pkgdesc='Load homebrew apps over network/usbgecko to your Wii'
arch=('i686' 'x86_64')
url='https://github.com/devkitPro/wiiload'
license=('GPL2')
depends=('zlib')
source=("https://github.com/devkitPro/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a3e4389bc9c6bc684e76baeb48903e59ac9e336148f0a29972b9671574fb6736')

build() {
  cd $pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  DESTDIR="$pkgdir/" make install
}
