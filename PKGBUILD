# Maintainer: Mobius Horizons <codemobius@gmail.com>
pkgname=hyperdex
pkgver=1.8.1
pkgrel=1
pkgdesc="HyperDex is a scalable, searchable key-value store"
url="http://hyperdex.org"
arch=('x86_64' 'i686')
license=('BSD')
depends=('google-glog' 'popt' 'libpo6' 'libe' 'busybee' 'hyperleveldb' 'replicant' 'libtreadstone' 'libmacaroons')
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('a529bb7d1d2e1115805362409d544174')

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
