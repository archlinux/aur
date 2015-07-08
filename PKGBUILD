# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=libgfshare
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="utilities for multi-way secret-sharing"
arch=( 'i686' 'x86_64' )
url="http://www.digital-scurf.org/software/libgfshare"
license=('custom')
groups=()
depends=(glibc)
makedepends=( 'automake' )
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://www.digital-scurf.org/files/libgfshare/libgfshare-2.0.0.tar.bz2')
noextract=()
sha1sums=('2813a69c7f69dfc406292af4c79f08cf46c54a4f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
