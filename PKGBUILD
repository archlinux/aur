# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=xtmsplit
pkgver=0.2
pkgrel=6
pkgdesc="Xtremsplit-compliant file splitter/merger"
arch=('x86_64')
url="http://www.software.caelistis.be/"
license=('GPL')
depends=('glibc')
source=(http://www.software.caelistis.be/${pkgname}-${pkgver}.tar.gz)
sha512sums=('4fbfbe4c736c6ff24d1ad7ae71f7c7f89d9f6b0d1777eb6878d59e3ffe3962edcf6cd62abdd67ad37c6669a731ed1f768aafb52a8b5f6b7672b45accfb08abad')

build() {
  cd ${pkgname}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}

  make DESTDIR="${pkgdir}" install
}
