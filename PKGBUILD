# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Vesa Kaihlavirta <vegai@iki.fi>
# Contributor: Markus Pargmann

pkgname=quesoglc
pkgver=0.7.2
pkgrel=3
pkgdesc="A free implementation of the OpenGL Character Renderer (GLC)"
arch=('x86_64')
url="http://quesoglc.sourceforge.net/"
license=('LGPL2.1')
depends=('fontconfig' 'freeglut' 'fribidi' 'glew')
makedepends=('pkg-config')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c2697a92e2cc00c537626020e4108a4e')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
