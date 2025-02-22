# Maintainer: Klaus Tachtler <klaus@tachtler.net>

pkgname=libtlsrpt
pkgver=0.5.0
pkgrel=1
pkgdesc="Interface library to implement TLSRPT reporting into an MTA and to generate and submit TLSRPT reports."
arch=('any')
url="https://github.com/sys4/libtlsrpt"
license=('LGPLv3+')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sys4/libtlsrpt/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('90a266d6be3dc3390342614e1f54e1eddf13b0ea208b900740ec01f28f30cd9f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
