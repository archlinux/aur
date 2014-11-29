# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mimms
pkgver=3.2.1
pkgrel=2
pkgdesc="Download streams using the MMS protocol and save them to your computer"
arch=('any')
url="http://savannah.nongnu.org/projects/mimms/"
license=('GPL3')
depends=('libmms' 'python2')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('ec629d8899551b4789ba15c17402c36f')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  sed -i "s/python/python2/g" Makefile
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}