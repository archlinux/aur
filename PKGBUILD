# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libt3key
pkgver=0.2.6
pkgrel=1
pkgdesc="Terminal key sequence database library."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libt3config>=0.2.5' 'libxcb')
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
md5sums=('6701cfe84a05f823f9760c17e433f9ae')

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
