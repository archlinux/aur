# Maintainer: Fabian Brosda <f.brosda@gmx.de>

pkgname=gauche-makiki
_pkgname=Gauche-makiki
pkgver=0.5
pkgrel=1
pkgdesc='A simple multithreaded http server'
url='https://github.com/shirok/Gauche-makiki'
arch=('i686' 'x86_64')
depends=('gauche')
makedepends=('make')
license=('BSD')

# include any patches you want to have applied here
source=('https://github.com/shirok/Gauche-makiki/archive/refs/tags/v0.5.tar.gz')
sha1sums=('398fc8eef20012fe5451db18f549fb9332ea866e')

build() {
  export LDFLAGS=""
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
