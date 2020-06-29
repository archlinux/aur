# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=xbindkeys
pkgver=1.8.7
pkgrel=1
pkgdesc="Launch shell commands with your keyboard or your mouse under X"
arch=('x86_64')
url="https://www.nongnu.org/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('libx11' 'guile')
optdepends=('tk: xbindkeys_show')
source=(https://www.nongnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a29b86a8ec91d4abc83b420e547da27470847d0efe808aa6e75147aa0adb82f2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
