# Contributor: LS-Shandong < ls-shandong at outlook dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gprofng-gui
pkgver=2.2
pkgrel=1
pkgdesc="A graphical tool to create, view, or both create as well as view, gprofng performance experiments."
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('bash' 'java-runtime')
makedepends=('java-environment')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('4a974d82f9e360bc442a4b548f170f92f4845b28e17e831007542b7dddfd1d95' 'SKIP')
validpgpkeys=(BDFA5717FC1DD35C2C3832A23EF90523B304AF08)
provides=('gp-display-gui')


build() {
  cd "$srcdir"/${pkgname}-${pkgver}/
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/
  make DESTDIR="$pkgdir" install
}
