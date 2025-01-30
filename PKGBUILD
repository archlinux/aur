# Maintainer: LS-Shandong < ls-shandong at outlook dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=gprofng-gui
pkgver=2.0
pkgrel=2
pkgdesc="A graphical tool to create, view, or both create as well as view, gprofng performance experiments."
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('bash' 'java-runtime')
makedepends=('java-environment')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('7E5512594FD98D258B3B73D9152E034F6D0CDC3937A2F58DB6D5AB4C7081DD87' '039ECDBA5E4475DE1ED71E3E35E0E0E44D9740B314FFF500F456E228FBCB6699')
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
