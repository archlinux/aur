# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=gxkb
pkgver=0.7.8
pkgrel=1
pkgdesc="X11 keyboard indicator and switcher"
arch=('i686' 'x86_64')
url="https://zen-tools.github.io/gxkb"
license=('GPL2')
depends=('libxklavier' 'libwnck')
source=("https://github.com/zen-tools/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('b709892a108875f83e17d48ab47a47b6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
