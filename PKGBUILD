# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=mp4v2
pkgver=1.9.1
pkgrel=2
pkgdesc="Library that provides functions to read, create, and modify mp4 files"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mp4v2/"
license=('MPL')
depends=('gcc-libs')
conflicts=('libmp4v2')
options=('!libtool')
source=(http://mp4v2.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('986701929ef15b03155ac4fb16444797')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

