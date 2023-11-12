# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>
pkgname=ohcount-git
pkgver=4.0.0.22.ge176f5e
epoch=1
pkgrel=1
pkgdesc="Ohcount is a source code line counter."
arch=('x86_64')
url="https://github.com/blackducksoftware/ohcount"
license=('GPL')
depends=('pcre')
makedepends=('git' 'bash' 'ruby' 'ragel' 'gperf')
provides=('ohcount')
conflicts=('ohcount')
install=
source=('git+https://github.com/blackducksoftware/ohcount.git')
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
