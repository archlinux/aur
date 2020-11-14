# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=freebloks
pkgver=1.5
pkgrel=1
pkgdesc="Clone of the Blokus board game in 3D with network support"
arch=('x86_64')
url="https://www.saschahlusiak.de/freebloks-3d/"
license=('GPL2')
depends=('libxpm' 'glu')
makedepends=('git')
source=("http://www.saschahlusiak.de/blokus/${pkgname}-${pkgver}.tar.gz")
sha256sums=('385fb13eaf2cf99de6ddba86d4bd371bca033a673497419f308dc4c38c3b3bd5')
conflicts=("${pkgname}-git")
replaces=("${pkgname}-git")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
