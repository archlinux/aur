# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=libzc
pkgver=0.4.1
pkgrel=1
pkgdesc="Tool and library for cracking zip files"
url="https://github.com/mferland/libzc"
license=('GPL3')
arch=('x86_64')
depends=('zlib')
source=("https://github.com/mferland/libzc/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

md5sums=('2f4dec4660959d4a0bda7838737ed8b5')
