# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=libpo6
pkgver=0.8.0
pkgrel=2
pkgdesc="libpo6 posix libraries for C++ used by HyperDex"
url="https://github.com/rescrv/po6"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('8a9eed68227eee7cf1911a3a07d627cc')

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
