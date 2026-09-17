# Maintainer: Fabian Brosda <f.brosda@gmx.de>

pkgname=gauche-makiki
_pkgname=Gauche-makiki
pkgver=0.5.1
pkgrel=1
pkgdesc='A simple multithreaded http server'
url='https://github.com/shirok/Gauche-makiki'
arch=('i686' 'x86_64')
depends=('gauche')
makedepends=('make')
license=('BSD')

# include any patches you want to have applied here
source=("https://github.com/shirok/Gauche-makiki/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('b45de9ff4263685d8254f91872a39f50c3e0969b')

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
