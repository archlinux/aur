# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libt3window
pkgver=0.2.3
pkgrel=1
pkgdesc="A library for creating window-based terminal programs."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libtranscript>=0.2.2' 'libunistring')
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
md5sums=('81fb7f90d7c315f083b9a64215741e68')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr CFLAGS="-O2 -D_POSIX_C_SOURCE=200809L"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/doc/$pkgname/API"
}
