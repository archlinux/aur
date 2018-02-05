# Maintainer: <clu>

pkgname=xpa
pkgver=2.1.18
pkgrel=1
epoch=
pkgdesc="A messaging system provides seamless communication between many kinds of Unix programs"
arch=('i686' 'x86_64')
url="http://hea-www.harvard.edu/RD/xpa/"
license=('MIT')
groups=()
depends=('tcl')
makedepends=('libxt')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/ericmandel/${pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('3219a872b033576969ad5a62aab866537ae63b29')
noextract=()

build() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -p1 -i ${startdir}/xpa_inc_fail.patch
  
  ./configure --prefix=/usr --enable-shared=link
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  mkdir -p ${pkgdir}/usr/bin
  make INSTALL_ROOT=${pkgdir} install
}

