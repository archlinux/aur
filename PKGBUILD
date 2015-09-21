# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libt3config
pkgver=0.2.10
pkgrel=1
pkgdesc="A library for reading and writing configuration files."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('gettext')
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
md5sums=('33468b8cb3e041c93b02f4b787f5265d')

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
