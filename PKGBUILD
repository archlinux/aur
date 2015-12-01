# Maintainer : ksj <podhorsky.ksj@gmail.com>

pkgname=lifeograph
pkgver=1.3.0.rc1
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
source=("https://launchpad.net/$pkgname/trunk/${pkgver:0:-1}/+download/$pkgname-$pkgver.tar.gz")

sha256sums=('fd461ea69b2677a0afc01b8b2206f94aa56b39053e9d31ec642f6bb7ed32519c')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver
  make  DESTDIR="$pkgdir" install
}
