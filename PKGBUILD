# Contributor: Nathan Owe. ndowens04 at gmail dot com
# Maintainer: aksr <aksr at t-com dot me>
pkgname=xaric
pkgver=0.13.7
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
md5sums=('46f4460dfab17819dd6d7e543be75206')
sha1sums=('c0cded0d57beddb11b04926b9c748835ef9da876')
sha256sums=('fd8cd677e2403e44ff525eac7c239cd8d64b7448aaf56a1272d1b0c53df1140c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make LIBS="-lncursesw -lpthread"
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir/ install
}

