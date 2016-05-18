# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-ctools
pkgver=1.2
pkgrel=1
pkgdesc="X Desktop Environment C-language tools"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/xde-ctools"
license=('GPL')
depends=('libsm' 'libwnck+' 'gtk2')
source=("https://github.com/bbidulock/xde-ctools/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('69132cd375d080c2e3dbed2b16401efa')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
