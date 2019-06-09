# Maintainer: Tuyen Pham <tuyenpm9@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>
# Contributor: kess <joe@macmahon.eu>
# Contributor: damir <damir@archlinux.org>
# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=abcm2ps
pkgver=8.14.4
pkgrel=1
pkgdesc="Convert ABC music notation files to PostScript from the commandline"
arch=('i686' 'x86_64')
url="http://moinejf.free.fr/"
license=('GPL')
depends=('pango' 'freetype2')
makedepends=('python-docutils')
conflicts=('abcm2ps-devel')
groups=(abc)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/leesavide/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('ce2708550725c2ec54022b4c4a076dad7ea7f33d9cd588e7df58bb5c989eccb4')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix="$pkgdir/usr" docdir=$pkgdir/usr/share/doc install
}
