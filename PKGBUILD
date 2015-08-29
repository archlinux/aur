# Maintainer: Marek Skrobacki <skrobul@skrobul.com>
pkgname=input-utils
pkgver=1.0
pkgrel=1
pkgdesc="Equivalent of Ubuntu/Debian's input-utils. Contains lsinput"
url="http://www.kraxel.org/releases/input/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
makedepends=('make' 'glibc' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://www.kraxel.org/releases/input/input-1.0.tar.gz")
md5sums=('3e58772e8647093b1de2f2c90bfb9ee8')

build() {
  cd "${srcdir}/input-${pkgver}"
  make prefix=/usr
}

package() {
  cd "${srcdir}/input-${pkgver}"
  make prefix=/usr DESTDIR="${pkgdir}" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
