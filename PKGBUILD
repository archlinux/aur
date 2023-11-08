# Maintainer: OpenSorcerer <alex cat opensourcery dog eu>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=duff
pkgver=0.5.2
pkgrel=5
pkgdesc="A command-line utility for quickly finding duplicates in a given set of files"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname"
license=('custom')
depends=('glibc' 'bash')
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('15b721f7e0ea43eba3fd6afb41dbd1be63c678952bf3d80350130a0e710c542e')

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
