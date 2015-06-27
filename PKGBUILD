# Contributor: Nathan Owe. ndowens04 at gmail dot com
# Maintainer: aksr <aksr at t-com dot me>
pkgname=xaric
pkgver=0.13.6
pkgrel=1
pkgdesc="A UNIX irc client similar to (and forked from) BitchX and ircII."
arch=('i686' 'x86_64')
url="http://xaric.org"
license=('GPL')
depends=('openssl')
conflicts=('xaric-git')
conflicts=()
replaces=()
source=("http://xaric.org/software/xaric/releases/$pkgname-$pkgver.tar.gz")
md5sums=('3523edcd8c8d5234b87c56c86c2dfdfc')
sha1sums=('ed10e395dea29fdf7bbc0d65389d789d7d4ca09b')
sha256sums=('dbed41ed43efcea05baac0af0fe87cca36eebd96e5b7d4838b38cca3da4518bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make 
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir/ install
}

