# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
pkgname=libt3widget
pkgver=0.4.7
pkgrel=1
pkgdesc="A C++ terminal dialog toolkit."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libt3key>=0.2.0' 'libt3window>=0.2.1' 'libsigc++' 'gpm')
makedepends=('libxcb')
optdepends=('libxcb: for integration with the X11 clipboard')
conflicts=()
replaces=()
backup=()
options=('!libtool')
install=''
changelog=
source=("http://os.ghalkes.nl/dist/$pkgname-$pkgver.tar.bz2")
noextract=()
md5sums=('530a1f8bd912800f5cebcfb8801998eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS="-O2 -std=c++11" ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/doc/$pkgname/API"
}
