# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libtranscript
pkgver=0.3.3
pkgrel=1
pkgdesc="A character set conversion library."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/$pkgname.html"
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
md5sums=('3f453d6f7e932598ac9737dfa655d8b6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-ucm2ltc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
