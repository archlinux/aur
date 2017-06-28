# Maintainer:
# Contributor: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=kover
pkgver=6
pkgrel=4
pkgdesc="Easy to use WYSIWYG CD cover printer with CDDB and CDTEXT support"
arch=('i686' 'x86_64')
url="http://lisas.de/kover/"
license=('GPL')
depends=('kdebase-runtime' 'libcdio')
makedepends=('cmake' 'automoc4')
source=("https://lisas.de/kover/$pkgname-$pkgver.tar.bz2")
sha256sums=('87494299d5dd7a51bbf3a1739f372da680744f14271c43d8495eca15f1f2480a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
