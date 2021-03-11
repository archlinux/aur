# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastian Wilzbach < sebi at wilzbach dot me >
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Ivy Foster <joyfulgirl (at) archlinux (dot) us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibutils
pkgver=6.10
pkgrel=2
pkgdesc="Bibliography format interconversion"
arch=("i686" "x86_64")
url="http://sourceforge.net/p/bibutils/home/Bibutils"
license=('GPL2')
makedepends=('tcsh')
depends=('glibc')
source=("${pkgname}-${pkgver}.tgz::https://sourceforge.net/projects/bibutils/files/bibutils_${pkgver}_src.tgz/download")
sha256sums=('8656c042fa1371443aa4e1a58bcab5fcea0b236eb39182e4004fc348ce56e496')

build() {
  cd "${pkgname}_${pkgver}"
  ./configure --dynamic --install-dir "$pkgdir"/usr/bin --install-lib "$pkgdir"/usr/lib
  make
}

package() {
  cd "${pkgname}_${pkgver}"
  make install
}
