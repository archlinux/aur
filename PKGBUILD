# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>
pkgname=ohcount-git
pkgver=2.0.1.312.g4fb66a8
epoch=1
pkgrel=1
pkgdesc="Ohcount is a source code line counter."
arch=('i686' 'x86_64')
url="https://github.com/blackducksw/ohcount"
license=('GPL')
depends=('pcre')
makedepends=('git' 'bash' 'ruby' 'ragel' 'gperf')
provides=('ohcount')
conflicts=('ohcount')
install=
source=('git+https://github.com/blackducksw/ohcount.git')
sha512sums=(SKIP)

pkgver() {
  cd ohcount
  git describe | tr - .
}

build() {
  cd ohcount
  ./build ohcount
}

package() {
  cd ohcount

  install --directory "$pkgdir/usr/bin"
  install bin/ohcount "$pkgdir/usr/bin/"
}
