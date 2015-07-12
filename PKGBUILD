# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Abel Stern <abel.stern AT gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=byacc
pkgver=20150711
pkgrel=1
pkgdesc="A Berkeley reimplementation of the Unix parser generator Yacc"
arch=('i686' 'x86_64')
url="http://invisible-island.net/byacc/"
license=('custom')
provides=('bison')
conflicts=('bison' 'byacc-noconflict')
source=(ftp://invisible-island.net/$pkgname/$pkgname.tar.gz)
sha256sums=('c354e4ee14c4a1bf11e55dde9275011d14887ef066406a088b6fa56caf039248')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

#License
  install -Dm644 README "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
