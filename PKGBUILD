# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=033
pkgrel=1
pkgdesc='Console client for Twitter and identi.ca'
arch=('i686' 'x86_64')
url='http://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth' 'json-c')
source=(http://www.kernel.org/pub/software/web/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('a3d9d8a86a718a4820387c75ac2af24fecfe754ee562163d700acb7cf795d753')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  
  make DESTDIR=${pkgdir} install
}
