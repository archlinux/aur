# Contributor: Andre Klitzing <andre AT incubo DOT de>
# Maintainer: max-k <max-k AT post DOT com>

pkgname=reprepro
pkgver=5.3.0
pkgrel=1
pkgdesc="A tool to handle local repositories of Debian packages"
arch=('i686' 'x86_64')
url="http://mirrorer.alioth.debian.org"
license=('GPL')
depends=('db' 'gpgme' 'zlib' 'bzip2' 'libarchive' 'libgpg-error' 'zlib')
optdepends=('apt: Importing from other sources'
            'gnupg' 'inoticoming' 'lzip' 'pinentry')
source=("http://ftp.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('5a5404114b43a2d4ca1f8960228b1db32c41fb55de1996f62bc1b36001f3fab4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
