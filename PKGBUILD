# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vicare-scheme  
pkgver=0.4.1
_subver=devel.3
pkgrel=2
pkgdesc="R6RS scheme implementation"
url="http://marcomaggi.github.io/vicare.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gmp')
source=("https://bitbucket.org/marcomaggi/$pkgname/downloads/$pkgname-${pkgver}-${_subver}.tar.xz")
md5sums=('fdb0f208c3d76cc79173fed303f85ebe')

build() {
  cd "$pkgname-${pkgver}-${_subver}"
  ./configure --prefix=/usr --libexecdir=/usr/lib --disable-rpath
  make 
}

check() {
  cd "$pkgname-${pkgver}-${_subver}"
  make check||true
}

package() {
  cd "$pkgname-${pkgver}-${_subver}"
  make DESTDIR=$pkgdir install
}
