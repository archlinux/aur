# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>

pkgname=tmd-git
pkgver=0.1.2
pkgrel=1
pkgdesc="A Tiny Markdown Parser"
url="https://github.com/WebReflection/tmd/#readme"
arch=(any)
license=(ISC)
makedepends=(gcc cmake)
provides=(tmd)
conflicts=(tmd)
source=("git+https://github.com/WebReflection/tmd.git")
sha256sums=('SKIP')

pkgver() {
  cd tmd
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd tmd
  make
}

package() {
  cd tmd
  install -D tmd "${pkgdir}/usr/local/bin/tmd"
}
