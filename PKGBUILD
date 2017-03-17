# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=guetzli-git
pkgver=1.0.8.g6bd68ae
pkgrel=1
pkgdesc="Perceptual JPEG encoder "
arch=('i686' 'x86_64')
url="https://github.com/google/guetzli"
license=('APL')
depends=('gflags' 'libpng')
makedepends=('git')
source=("git+https://github.com/google/guetzli.git")
sha256sums=('SKIP')


pkgver() {
  cd "guetzli"

  git describe --long --tags | sed 's/^[A-Za-z]*//;s/-/./g'
}

build() {
  cd "guetzli"

  make config=release
}

package() {
  cd "guetzli"

  install -d "$pkgdir/usr"
  install -Dm755 "bin/Release/guetzli" "$pkgdir/usr/bin/guetzli"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/guetzli/LICENSE"
}
