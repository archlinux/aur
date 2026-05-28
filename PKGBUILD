# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=got-vcs
pkgver=0.126
pkgrel=1
pkgdesc="Game of Trees (Got) is a version control system which prioritizes ease of use and simplicity over flexibility."
arch=('x86_64')
url="https://gameoftrees.org/"
license=('ISC')
depends=('libbsd' 'libretls')
makedepends=('bc')
source=("https://gameoftrees.org/releases/portable/got-portable-${pkgver}.tar.gz")
md5sums=('961caeab3f0374d36bab25df51535586')

build() {
  cd got-portable-${pkgver}
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --sbindir=/usr/bin \
              --bindir=/usr/bin \
              --libdir=/usr/bin
  make
}

package() {
  cd got-portable-${pkgver}
  make DESTDIR="${pkgdir}" install
}
