# Maintainer: Samadi van Koten

pkgname=yarn-vm-git
pkgver=r12.3219110
pkgrel=1
pkgdesc='A small embeddable VM with a custom instruction set and everything stored in a statically allocated memory space.'
arch=('any')
url='https://github.com/WetDesertRock/Yarn'
license=('MIT')
depends=(glibc)
makedepends=(git)
source=('git+https://github.com/WetDesertRock/Yarn.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Yarn"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Yarn"
  ./build.sh
}

package() {
  cd "$srcdir/Yarn"
  install -Dm755 bin/yarn -t "$pkgdir/usr/bin/"
}


