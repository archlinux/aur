# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=guetzli-git
pkgver=1.0.1.r72.g0b78c7c
pkgrel=1
pkgdesc="Perceptual JPEG encoder"
arch=('i686' 'x86_64')
url="https://github.com/google/guetzli"
license=('Apache')
depends=('libpng')
makedepends=('git')
provides=('guetzli')
conflicts=('guetzli')
source=("git+https://github.com/google/guetzli.git")
sha256sums=('SKIP')


pkgver() {
  cd "guetzli"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "guetzli"

  make config=release
}

package() {
  cd "guetzli"

  install -d "$pkgdir/usr"
  install -Dm755 "bin/Release/guetzli" "$pkgdir/usr/bin/guetzli"
}
