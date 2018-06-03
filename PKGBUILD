# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>
# Contributor: kess <joe@macmahon.eu>
# Contributor: damir <damir@archlinux.org>
# Contributor: Luis Pablo Gasparotto <lpgasparotto(at)gmail(dot)com>

pkgname=abcm2ps
pkgver=8.13.22
pkgrel=1
pkgdesc="Convert ABC music notation files to PostScript from the commandline"
arch=('i686' 'x86_64')
url="http://moinejf.free.fr/"
license=('GPL')
depends=('pango' 'freetype2')
conflicts=('abcm2ps-devel')
groups=(abc)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/leesavide/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('9a1379fd93fcf2d87d580c85b43ca1930a4bc412c291be551af1035d08f26c36')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix="$pkgdir/usr" docdir=$pkgdir/usr/share/doc install
}