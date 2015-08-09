# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>;

pkgname=ministat-git
pkgver=20120914
pkgrel=1
pkgdesc="A small tool to do the statistics legwork on benchmarks etc."
arch=('i686' 'x86_64')
url="http://github.com/codemac/ministat"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('ministat')
conflicts=('ministat')
source=('git+https://github.com/codemac/ministat.git')
md5sums=('SKIP')

pkgver() {
  cd ministat
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}


build() {
  cd ministat
  make
}

package() {
  cd ministat
  make DESTDIR="$pkgdir" install
} 
