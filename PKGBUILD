# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=pik-git
pkgver=1c65996
pkgrel=1
epoch=1
pkgdesc="A new lossy image format for the internet"
arch=('i686' 'x86_64')
url="https://github.com/google/pik"
license=('Apache')
depends=('glibc' 'libjpeg' 'libpng')
makedepends=('git')
provides=('pik')
conflicts=('pik')
source=("git+https://github.com/google/pik.git")
sha256sums=('SKIP')


pkgver() {
  cd "pik"

  git describe --always
}

build() {
  cd "pik"

  make
}

package() {
  cd "pik"

  install -d "$pkgdir/usr"
  install -Dm755 "bin/cpik" "$pkgdir/usr/bin/cpik"
  install -Dm755 "bin/dpik" "$pkgdir/usr/bin/dpik"
}
