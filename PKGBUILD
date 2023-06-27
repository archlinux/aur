# Contributor: Maximilian Stein <theoddbird@posteo.org>

pkgname=getdata
pkgver=0.11.0
pkgrel=1
pkgdesc="reference implementation of the Dirfile Standards"
arch=('i686' 'x86_64')
url="http://getdata.sourceforge.net/"
license=('GPL')
depends=(pcre2) #python
source=(https://github.com/ketiltrout/getdata/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
b2sums=('bff794686ece671536a240f235fff4d4cc94d8faea63192d535231c86f630b5a254738fef18dd54159dd1508a2ff07a010d12ca49754cb3d8efcc4ea91de2fb2')


build() {
  cd "$pkgname-$pkgver"
  #./configure --prefix=/usr --disable-matlab --with-python="/usr/bin/python" --with-pcre
  ./configure --prefix=/usr --disable-matlab --without-python --with-pcre
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR=$pkgdir install 
}
