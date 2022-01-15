# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Sebastian Wilzbach < sebi at wilzbach dot me >
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Ivy Foster <joyfulgirl (at) archlinux (dot) us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bibutils
pkgver=7.2
pkgrel=1
pkgdesc="Bibliography format interconversion"
arch=("i686" "x86_64")
url="http://sourceforge.net/p/bibutils/home/Bibutils"
license=('GPL2')
makedepends=('tcsh')
depends=('glibc')
source=("${pkgname}-${pkgver}.tgz::https://sourceforge.net/projects/bibutils/files/bibutils_${pkgver}_src.tgz/download")
sha256sums=('6e028aef1e8a6b3e5acef098584a7bb68708f35cfe74011b341c11fea5e4b5c3')

build() {
  cd "${pkgname}_${pkgver}"
  ./configure --dynamic --install-dir "$pkgdir"/usr/bin --install-lib "$pkgdir"/usr/lib
  make
}

package() {
  cd "${pkgname}_${pkgver}"
  make install
}
