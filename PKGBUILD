# Maintainer: Gertjan Halkes <arch at ghalkes dot nl>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=libt3highlight
pkgver=0.5.0
pkgrel=1
pkgdesc="A syntax highlighting library."
arch=('x86_64' 'i686')
url="http://os.ghalkes.nl/t3/$pkgname.html"
license=('GPL3')
groups=()
depends=('libt3config>=0.2.5' 'pcre2')
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
md5sums=('183285cb9ef6c94abde9e7b5b30bf599')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
