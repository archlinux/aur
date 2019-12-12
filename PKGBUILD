# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=tilde
pkgver=1.1.1
pkgrel=1
pkgdesc="An intuitive text editor for the terminal."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/$pkgname.html"
license=('GPL3')
groups=()
depends=('libtranscript>=0.2.0' 'libt3widget>=1.2.0' 'libt3highlight>=0.4.0' 'libt3config>=1.0.0')
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
md5sums=('59cc8418c3f0e69d1cf3e4de2d3c313f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
