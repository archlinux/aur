# Maintainer: Niels Sonnich Poulsen <niels@nielssp.dk>
pkgname=csol
pkgver=1.4.1
pkgrel=1
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
md5sums=('9468c26de693b8dba86f2555565b29b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

