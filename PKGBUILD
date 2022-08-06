# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>

pkgname=xscope
pkgver=1.4.3
pkgrel=1
pkgdesc="A program to monitor X11/Client conversations"
arch=('x86_64' 'i686')
url="http://cgit.freedesktop.org/xorg/app/xscope/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'xorgproto' 'xtrans' 'xorg-util-macros')
source=("${pkgname}-${pkgver}.tar.gz::http://xorg.freedesktop.org/archive/individual/app/xscope-${pkgver}.tar.gz")

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}/" install
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/xscope/"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('86f9da3cf0422b5964191c9e8f792e107577818de094b38db0a6dbce403a9b54')
