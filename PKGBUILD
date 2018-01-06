# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpck
pkgver=0.21
pkgrel=1
license=('GPL')
pkgdesc="Reads MP3 files and tries to determine if they are correct"
arch=('x86_64')
url="http://checkmate.gissen.nl/"
depends=('glibc')
source=("http://checkmate.gissen.nl/checkmate-${pkgver}.tar.gz")
md5sums=('81d5d0b620f0fe3cc23c272021e9f23c')

build() {
  cd checkmate-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd checkmate-${pkgver}

  make prefix="${pkgdir}/usr" install
}
