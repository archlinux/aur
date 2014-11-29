# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Army
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=aaphoto
pkgver=0.43.1
pkgrel=1
pkgdesc="Automatic photo adjusting"
arch=('i686' 'x86_64')
url="http://log69.com/aaphoto_en.html"
license=('GPL3')
depends=('jasper' 'libpng')
source=(https://github.com/log69/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('35a21d075d297872e35f52c9e92ab8e7ee403f5ecf4927634f22b56bb401b5ca')

build() {
   cd "${srcdir}"/${pkgname}-${pkgver}

   ./configure --prefix=/usr
   make
}

package() {
   cd "${srcdir}"/${pkgname}-${pkgver}

   make DESTDIR="${pkgdir}" install
}
