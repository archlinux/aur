# Contributor: Andre Klitzing <andre AT incubo DOT de>
# Maintainer: max-k <max-k AT post DOT com>

pkgname=reprepro
pkgver=4.16.0
pkgrel=1
pkgdesc="A tool to handle local repositories of Debian packages"
arch=('i686' 'x86_64')
url="http://mirrorer.alioth.debian.org"
license=('GPL')
depends=('db' 'gpgme' 'zlib' 'bzip2' 'libarchive')
optdepends=('apt: Importing from other sources')
source=("http://ftp.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('fdd2cae3f23b26e3b44734925af5afb76486a46bde104254eb04d8344d98f591')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
