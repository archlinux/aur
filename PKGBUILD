# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=tilde
pkgver=0.3.6
pkgrel=1
pkgdesc="An intuitive text editor for the terminal."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/$pkgname.html"
license=('GPL3')
groups=()
depends=('libt3widget>=0.5.0' 'libt3highlight>=0.4.0')
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
md5sums=('44ee789a8be3417e0f81b29938addb8d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  CXXFLAGS="-O2 -std=c++11" ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
