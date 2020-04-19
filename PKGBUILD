# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>

pkgname=xscope
pkgver=1.4.1
pkgrel=2
pkgdesc="A program to monitor X11/Client conversations"
arch=('x86_64' 'i686')
url="http://cgit.freedesktop.org/xorg/app/xscope/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'xorgproto' 'xtrans' 'xorg-util-macros')
source=("http://xorg.freedesktop.org/archive/individual/app/xscope-${pkgver}.tar.gz")
sha256sums=('f99558a64e828cd2c352091ed362ad2ef42b1c55ef5c01cbf782be9735bb6de3')

build() {
  cd "${srcdir}/xscope-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xscope-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 README -t "${pkgdir}/usr/share/doc/xscope/"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}