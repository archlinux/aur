# Maintainer: Mike Pento <mjpento@gmail.com>

pkgname=epplet-base
pkgver=0.18
pkgrel=1
pkgdesc="Addon plugins for the enlightenment windowmanager"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('GPL-1.0-or-later')
depends=('imlib2' 'libcdaudio' 'libgl' 'libxext' 'glibc' 'libx11')
makedepends=('mesa')
options+=('!debug')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/e16-epplets-${pkgver}.tar.gz)
sha512sums=('a1070e6334b7688a10fd15fdec4bb48d5a42c8f27bc82ab98cbc719b3ca94d21530acccd76c6b4d04553c327994bea8869bcdb6841d85efb82d99dbd27715e7a')

build() {
  cd e16-epplets-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd e16-epplets-${pkgver}
  make DESTDIR="${pkgdir}" install
}
