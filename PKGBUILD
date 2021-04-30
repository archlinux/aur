# Maintainer: robertfoster

pkgname=libsmacker
pkgver=1.1.1r35
pkgrel=1
pkgdesc="A C library for decoding .smk Smacker Video files"
arch=('i686' 'x86_64')
url="http://libsmacker.sourceforge.net"
license=('LGPL2.1')
depends=('glibc')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")

prepare() {
  cd "${pkgname}-${pkgver%r*}"
  autoreconf -i
}

build() {
  cd "${pkgname}-${pkgver%r*}"
  ./configure --prefix=/usr
}

check() {
  cd "${pkgname}-${pkgver%r*}"
  make -k check
}

package() {
  cd "${pkgname}-${pkgver%r*}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('bb9c22c02ecda189a3389c9340a0eb6a8f287aa257099b54c3d9e1802a454630')
