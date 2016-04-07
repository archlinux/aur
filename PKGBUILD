# Maintainer: Christian Rebischke <Chris.Rebischke[at]archlinux[dot]org>
pkgname=libemu
pkgver=1.0
pkgrel=1
pkgdesc="A small library written in c offering basic x86 emulation and shellcode detection"
arch=('i686' 'x86_64')
url="https://github.com/buffer/libemu"
license=('GPL2')
depends=('glibc')
makedepends=()
conflicts=('libemu-git')
source=("https://github.com/buffer/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('183623536e92e8ac7136b337aaba009d')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -v -i
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set et sw=2 ts=2 tw=79:
