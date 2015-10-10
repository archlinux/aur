# Maintainer: MobiusHorizons <codemobius@gmail.com>
pkgname=replicant
pkgver=0.8.1
pkgrel=1
pkgdesc="A system for maintaining replicated state machines used for HyperDex"
url="https://github.com/rescrv/Replicant"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=('wget' 'gcc')
conflicts=()
replaces=()
backup=()
source=("http://hyperdex.org/src/${pkgname}-${pkgver}.tar.gz")
md5sums=('c7bac99c7813dce22e36fc80c839f7fe')

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
