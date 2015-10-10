# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=hyperleveldb
pkgver=1.2.2
pkgrel=1
pkgdesc="A fork of LevelDB intended to meet the needs of HyperDex while remaining compatible with LevelDB used by HyperDex"
url="https://github.com/rescrv/HyperLevelDB"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('440d22289fa0fd355d01bc8ee04e04ae')

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
