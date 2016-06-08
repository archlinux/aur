# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vicare-scheme  
pkgver=0.4d0pre1
_pkgver=0.4d0
pkgrel=4
pkgdesc="R6RS scheme implementation"
url="http://marcomaggi.github.io/vicare.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gmp')
source=("https://bitbucket.org/marcomaggi/$pkgname/downloads/$pkgname-${pkgver}.tar.xz")
md5sums=('fd7dcfc1189a6c2636d606f86ed6f0bd')

build() {
  cd "$pkgname-${_pkgver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib --disable-rpath
  make 
}

check() {
  cd "$pkgname-${_pkgver}/build"
  make check||true
}

package() {
  cd "$pkgname-${_pkgver}"
  make DESTDIR=$pkgdir install
}
