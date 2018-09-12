# Maintainer: Samuel Tardieu <sam@rfc1149.net>

pkgname=recoverjpeg 
pkgver=2.6.3
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="recover lost jpeg (.jpg) and mov files from a raw disk"
url="https://rfc1149.net/devel/recoverjpeg"
license=('GPL')
depends=('bash' 'python')
source=(https://rfc1149.net/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('db996231e3680bfaf8ed77b60e4027c665ec4b271648c71b00b76d8a627f3201')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D -m 644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
