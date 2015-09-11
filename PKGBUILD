# Maintainer : ksj <podhorsky.ksj@gmail.com>

pkgname=lifeograph
pkgver=1.2.1
pkgrel=1
pkgdesc="off-line and private journal and note taking application"
arch=('i686' 'x86_64')
license=('GNU GPL v3')
url="https://launchpad.net/lifeograph"
depends=('gtkmm3' 'enchant' 'libgcrypt')
makedepends=(cmake)
optdepends=()
install=$pkgname.install
options=('!emptydirs' '!makeflags')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")

sha256sums=('ea693ebbba93f2d72790f37fb411d982d86663138c62ab05b33a538135e19819')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make  DESTDIR="$pkgdir" install
}
