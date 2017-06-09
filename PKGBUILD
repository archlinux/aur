# Maintainer: alienzj <lovelornpig@gmail.com>

pkgname=bioawk
pkgver=1.0.0.r44.5e8b41d
pkgrel=1
pkgdesc="BWK awk modified for biological data"
arch=('i686' 'x86_64')
url="https://github.com/lh3/bioawk"
license=('GPL')
provides=("bioawk")
conflicts=("bioawk")
source=("git://github.com/lh3/bioawk.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  echo "1.0.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 bioawk $pkgdir/usr/bin/bioawk
}
