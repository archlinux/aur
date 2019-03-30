# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: dcraven <dcraven@gmail.com>

pkgname=bless
pkgver=0.6.1
pkgrel=3
pkgdesc="High-quality, full-featured hex editor"
arch=('any')
url="https://web.archive.org/web/20170503150524/http://home.gna.org/bless/"
license=('GPL')
depends=('gtk-sharp-2')
makedepends=('rarian' 'automake')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/afrantzis/bless/archive/v0.6.1.tar.gz")
sha256sums=('5f82e43e22e48080ea8e24668197f79dc8bddfcbf3b5f631dbe17f952e7b0f0e')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
