pkgname=simple-password
_reponame=spass
pkgver=0.1.1
pkgrel=1
pkgdesc="A password generator without any unnecessary stuff"
arch=('x86_64')
url="https://github.com/ESzPa/spass"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'xxd')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d863ad4f0f26dc2e4f5c1bbea310f9df17fe08c1ed5dfb1fbc08afcf2a0a0a0')

build() {
  cmake -B build -S "$_reponame-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
