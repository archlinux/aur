# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libt3highlight
pkgver=0.3.5
pkgrel=1
pkgdesc="A syntax highlighting library."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libt3config>=0.2.5')
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
md5sums=('f94e06aeae9f66807a7d7aeccd593610')

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
