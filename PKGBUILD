# Maintainer: <clu>

pkgname=xpa
pkgver=2.1.17
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
sha1sums=('9296bb5eae891f75b4fd7105f9142157cb99e238')
noextract=()

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver

  mkdir -p ${pkgdir}/usr/bin
  make INSTALL_ROOT=${pkgdir} install
}

