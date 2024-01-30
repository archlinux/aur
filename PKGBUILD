# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=pion-ng
pkgver=5.0.8
pkgrel=1
pkgdesc="Pion Network Library"
arch=(x86_64)
url="https://github.com/rimmartin/pion-ng"
license=('BSL-1.0')
depends=('boost-libs' 'openssl')
makedepends=('git' 'boost')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cd7dd8635e3ef0c57fb16f4aea19d43b02890ee5a3d78882b139d1069bdb167b')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
