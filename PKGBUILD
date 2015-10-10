# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=libtreadstone
pkgver=0.2.0
pkgrel=2
pkgdesc="libtreadstone manipulates JSON and is used by HyperDex" 
url="https://github.com/rescrv/libtreadstone"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc' 'libpo6' 'libe')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('9a8c2906abc6deb60d5f9234bac512c6')

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
