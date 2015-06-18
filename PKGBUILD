# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=valabind
pkgver=0.9.2
pkgrel=1
pkgdesc="Tool to parse vala or vapi files to transform them into swig interface files, C++, NodeJS-ffi or GIR"
url="http://radare.org"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('vala' 'swig' 'sh')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/radare/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('204b74a851dc052afeecfb7b98e8b8a4e3ae5e05c7bda3213f38a4f30e144cfc9a1ad9fc5197ae1dd8e2ff931df87cce7810ce37c900e4d8e287abaecef43b9b')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
