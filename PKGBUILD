# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=busybee
pkgver=0.7.0
pkgrel=1
pkgdesc="BusyBee is a high-performance messaging layer used by HyperDex"
url="https://github.com/rescrv/busybee"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('b40f89f92478933f9a14334ddfee5af8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
