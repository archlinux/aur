# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=bioawk-git
pkgver=1.0.0.r51.fd40150
pkgrel=2
pkgdesc="BWK awk modified for biological data"
arch=('i686' 'x86_64')
url="https://github.com/lh3/bioawk"
license=('GPL')
provides=("bioawk")
conflicts=("bioawk")
makedepends=('bison' 'make' 'gcc' 'git')
source=("git+https://github.com/lh3/bioawk.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/bioawk"
  echo "1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/bioawk"
  make
}

package() {
  cd "$srcdir/bioawk"
  install -Dm755 bioawk $pkgdir/usr/bin/bioawk
}
