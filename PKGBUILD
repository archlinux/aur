# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duff
pkgver=0.5.2
pkgrel=4
pkgdesc="A command-line utility for quickly finding duplicates in a given set of files"
arch=('i686' 'x86_64')
url="http://downloads.sourceforge.net/sourceforge/${pkgname}"
license=('custom')
depends=('glibc' 'sh')
source=("$url/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('5615ce50f971d29f6a13bbf4d4ab2d5a7134aad157741515c51d3921aa1b755d')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}

