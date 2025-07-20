# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=csol
pkgver=1.6.0
pkgrel=2
pkgdesc="A small collection of ncurses-based solitaire/patience games."
url="https://github.com/nielssp/csol"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ncurses')
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/nielssp/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('5bb919511d9e049f5c325f14dfc7ef43')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 CHANGES.md "$pkgdir/usr/share/doc/$pkgname/CHANGES.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

