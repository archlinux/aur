# Maintainer: Schwonder Reismus <schw0reismus@protonmail.com>

pkgname=tox_extension_messages
pkgver=0.0.3
pkgrel=1
pkgdesc=''
arch=('x86_64')
url='https://github.com/toxext/$pkgname'
license=('GPL3')
depends=()
makedepends=()
source=("https://github.com/toxext/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('71da6b1850d7775db9514ee1e13805e02ef4cae5399369f1e644180c5672c2d1faf7584cd939ea002d7315b36d16233a26697dbefe74bb476c70108db01ea2d9')

prepare() {
  cd $pkgname-$pkgver
  mkdir -p build
}

build() {
  cd $pkgname-$pkgver
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  cd build
  make DESTDIR="$pkgdir" install
}
