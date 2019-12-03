# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=libt3widget
pkgver=1.2.0
pkgrel=1
pkgdesc="A C++ terminal dialog toolkit."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libtranscript>=0.2.2' 'libt3key>=0.2.0' 'libt3window>=0.4.0' 'libsigc++' 'gpm' 'pcre2')
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
md5sums=('9f99670096687c3a73c30ec1b0058aa2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
