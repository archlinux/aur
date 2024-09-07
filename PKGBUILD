# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libvisual
pkgver=0.4.2
pkgrel=2
pkgdesc="Abstraction library that comes between applications and audio visualisation plugins"
arch=('x86_64')
url="https://sourceforge.net/projects/libvisual/"
license=('LGPL')
depends=('glibc' 'sdl12-compat')
source=(https://github.com/Libvisual/libvisual/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('63085fd9835c42c9399ea6bb13a7ebd4b1547ace75c4595ce8e9759512bd998a')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
