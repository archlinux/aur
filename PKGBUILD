# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-indicator
pkgver=0.3.4
pkgrel=1
pkgdesc="Provides an indicator for Haguichi"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'haguichi')
makedepends=('meson' 'vala')
source=("http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.xz")
sha256sums=('3c67456d731dbf6f1c9d61302c48a76cc9975559af0d8bc59c8a57e6f00aa7da')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  meson ..
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C $pkgname-$pkgver/build install
}
