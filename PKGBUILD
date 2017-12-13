# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Army
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=aaphoto
pkgver=0.45
pkgrel=1
pkgdesc="Automatic photo adjusting"
arch=('i686' 'x86_64')
url="http://log69.com/aaphoto_en.html"
license=('GPL3')
depends=('jasper' 'libpng')
source=(http://log69.com/downloads/${pkgname}_sources_${pkgver}.tar.gz)
sha256sums=('d3a92824cee335516a560aa0e8198e67be1fa2a93aca3508167c142f33d9e20a')

build() {
   cd "${srcdir}"/$pkgname-$pkgver

   ./configure --prefix=/usr
   make
}

package() {
   cd "${srcdir}"/$pkgname-$pkgver

   make DESTDIR="${pkgdir}" install
}
