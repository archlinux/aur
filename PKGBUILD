# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Army
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=aaphoto
pkgver=0.43
pkgrel=1
pkgdesc="Automatic photo adjusting"
arch=('i686' 'x86_64')
url="http://log69.com/aaphoto_en.html"
license=('GPL3')
depends=('jasper' 'libpng')
source=(https://github.com/log69/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('3405144c20b7376e1ba1be44333f55a6409a22c190bf3b17c620ea588ace9f29')

build() {
   cd ${srcdir}/${pkgname}-${pkgver}

   ./configure --prefix=/usr
   make
}

package() {
   cd ${srcdir}/${pkgname}-${pkgver}

   make DESTDIR=${pkgdir} install
}
