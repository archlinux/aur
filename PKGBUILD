# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=guetzli-git
pkgver=1.0.1.r76.g214f2bb
pkgrel=1
pkgdesc="Perceptual JPEG encoder"
arch=('i686' 'x86_64')
url="https://github.com/google/guetzli"
license=('Apache')
depends=('libpng')
makedepends=('git')
provides=("guetzli=$pkgver")
conflicts=('guetzli')
source=("git+https://github.com/google/guetzli.git")
sha256sums=('SKIP')


pkgver() {
  cd "guetzli"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "guetzli"

  make \
    config=release
}

package() {
  cd "guetzli"

  install -Dm755 "bin/Release/guetzli" -t "$pkgdir/usr/bin"
}
