# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thayer Williams <thayer@archlinux.org>

pkgname=xbindkeys
pkgver=1.8.6
pkgrel=3
pkgdesc="Launch shell commands with your keyboard or your mouse under X"
arch=('x86_64')
url="https://www.nongnu.org/xbindkeys/xbindkeys.html"
license=('GPL')
depends=('libx11' 'guile')
optdepends=('tk: xbindkeys_show')
source=(https://www.nongnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('c6ea9db56e075dae0697497e2ed390cc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
