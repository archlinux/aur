# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>

pkgname=vtable-dumper
pkgver=1.2
pkgrel=1
pkgdesc="A tool to list content of virtual tables in a C++ shared library."
arch=('i686' 'x86_64')
url="https://github.com/lvc/vtable-dumper"
license=('LGPL')
depends=('libelf' 'gcc-libs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('1b1e2bc09b0fe63abf01e1ad2526c40d')
sha1sums=('2ae56500487a9073eddc1c7c1fcf7fd537c8984b')
sha256sums=('6993781b6a00936fc5f76dc0db4c410acb46b6d6e9836ddbe2e3c525c6dd1fd2')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR=${pkgdir} prefix=/usr
}
