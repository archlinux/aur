# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=jwmtools
pkgver=0.1.78
pkgrel=3
pkgdesc="Various tools for jwm window manager."
arch=('i686' 'x86_64')
url="https://github.com/kostelnik/jwmtools"
license=('GPL')
conflicts=('jwmtools-git')
makedepends=('mdsplib')
depends=('libglade' 'libxss')
source=("https://github.com/bbidulock/${pkgname}/releases/download/0.1/${pkgname}-${pkgver}.tar.xz")
md5sums=('30759916e99fb9f4805e795a4e4aca68')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
