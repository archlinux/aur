# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=dynstr
pkgver=0.1.0
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://gitea.privatedns.org/xavi/dynstr"
license=('GPL3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver-rc1.tar.gz")
sha512sums=('3c83382c8a080d44d5573b007f1f15a7236c4746ade1429b4be825e9c73f51d8b66bee9662cc6b650d17f106015577e48dbd299d52a7cdebb7f2d9bfa1bba4bc')

build() {
  cd "$pkgname"

  cmake -B build
  cmake --build build
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

