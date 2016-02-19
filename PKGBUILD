# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=libt3widget
pkgver=0.5.1
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
md5sums=('cec6ab1f641c20973270edb7176c0c5d')

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
