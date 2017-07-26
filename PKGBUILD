# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=butteraugli-git
pkgver=290e395
pkgrel=1
epoch=1
pkgdesc="A tool for measuring perceived differences between images"
arch=('i686' 'x86_64')
url="https://github.com/google/butteraugli"
license=('Apache')
depends=('glibc' 'libjpeg' 'libpng')
makedepends=('git')                               #bazel
provides=('butteraugli')
conflicts=('butteraugli')
source=("git+https://github.com/google/butteraugli.git")
sha256sums=('SKIP')


pkgver() {
  cd "butteraugli"

  git describe --always
}

build() {
  cd "butteraugli/butteraugli"

  make
}

package() {
  cd "butteraugli"

  install -d "$pkgdir/usr"
  install -Dm755 "butteraugli/butteraugli" "$pkgdir/usr/bin/butteraugli"
}
