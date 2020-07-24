# Maintainer: goetzc
# Contributor: Dan Liew <dan at su-root dot co dot uk>
pkgname=simple-mtpfs
pkgver=0.4.0
pkgrel=1
pkgdesc="A FUSE filesystem that supports reading/writing from MTP devices"
arch=('i686' 'x86_64')
url="https://github.com/phatina/simple-mtpfs/"
license=('GPL2')
makedepends=('autoconf-archive')
depends=('libmtp' 'fuse' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/phatina/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('1d011df3fa09ad0a5c09d48d84c03e6cddf86390af9eb4e0c178193f32f0e2fc')
