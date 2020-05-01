# Maintainer: Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
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
sha256sums=('6c0d18be19fc19ab9b4595edf3a23c0a6946c8a5eb5c1bc395471c8f9a710d18')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
