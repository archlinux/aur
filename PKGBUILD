# Maintainer: Jure Varlec <jure at varlec dot si>
# Contributor: Gore Liu <goreliu@126.com>
# Contributor: codestation <codestation404 at gmail dot com>

pkgname=prll
pkgver=0.6.4
pkgrel=1
pkgdesc="A utility for parallelizing execution in bash or zsh"
arch=('i686' 'x86_64')
url="https://github.com/exzombie/prll"
license=('GPL')

source=($pkgname-$pkgver.tar.gz::https://github.com/exzombie/$pkgname/archive/$pkgver.tar.gz)

md5sums=('852b906050ab61de5738d491b94b2b79')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
