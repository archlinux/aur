# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Brian Knox <taotetek@gmail.com>

pkgname=libee
pkgver=0.4.1
pkgrel=4
pkgdesc="event expression library inspired by CEE"
url="http://www.libee.org/"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=('libestr' 'glibc')
makedepends=()
optdepends=()
source=("http://www.libee.org/files/download/libee-$pkgver.tar.gz")
md5sums=('7bbf4160876c12db6193c06e2badedb2')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make -j1
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make install DESTDIR="$pkgdir"
}
