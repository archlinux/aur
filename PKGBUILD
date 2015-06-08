# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Leandro de Assis <leandrodiassis@gmail.com>

pkgname=popstation
pkgver=1.0.0
pkgrel=2
pkgdesc="Play PSX Games in Sony PSP, One Disc Games"
arch=('i686' 'x86_64')
url="http://dark-alex.org/"
license=('GPL')
depends=('zlib')
source=("http://leandroufcgprojects.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('0c16b9d7846fa1b62fdafc756478b34d524baf33')
options=('!buildflags')

prepare() {
  rm -fr build
  cp -R "${pkgname}" build
}

build() {
  cd build
  make
}

package() {
  cd build
  install popstation -Dm755 "${pkgdir}/usr/bin/popstation"
}
