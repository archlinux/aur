# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=libmacaroons
pkgver=0.3.0
pkgrel=1
pkgdesc="Libmacaroons provides flexible authorization credentials that support decentralized delegation, attenuation, and verification, and is used by HyperDex."
url="https://github.com/rescrv/libmacaroons"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('99e86f7813366f1d17bb4164bab63d7a')

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
