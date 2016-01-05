# Contributor: Andre Klitzing <andre AT incubo DOT de>
# Maintainer: max-k <max-k AT post DOT com>

pkgname=reprepro
pkgver=4.17.0
pkgrel=1
pkgdesc="A tool to handle local repositories of Debian packages"
arch=('i686' 'x86_64')
url="http://mirrorer.alioth.debian.org"
license=('GPL')
depends=('db' 'gpgme' 'zlib' 'bzip2' 'libarchive')
optdepends=('apt: Importing from other sources')
source=("http://ftp.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('97ef4dc26f6f81981a591d620adadb233074a36d7e042d56711eb4e885ce68fa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
