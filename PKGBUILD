# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libt3window
pkgver=0.3.2
pkgrel=1
pkgdesc="A library for creating window-based terminal programs."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libtranscript>=0.2.2' 'libunistring' 'ncurses')
makedepends=()
optdepends=()
conflicts=()
replaces=()
backup=()
options=('!libtool')
install=''
changelog=
source=("http://os.ghalkes.nl/dist/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=('beb6aeb84ff3dab1dbcce3407e366d23')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
