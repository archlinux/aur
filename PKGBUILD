# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Abel Stern <abel.stern AT gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=byacc
pkgver=20141006
pkgrel=1
pkgdesc="A Berkeley reimplementation of the Unix parser generator Yacc"
arch=('i686' 'x86_64')
url="http://invisible-island.net/byacc/"
license=('custom')
provides=('bison')
conflicts=('bison' 'byacc-noconflict')
source=(ftp://invisible-island.net/$pkgname/$pkgname.tar.gz)
sha256sums=('391b0ac550e94920a86960c6973ec539784dc84849e7c2bb1645ae6d8178b14d')

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
