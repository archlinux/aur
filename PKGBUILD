# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: boyska <piuttosto@logorroici.org>
pkgname=libgfshare
pkgver=1.0.5
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
source=('http://www.digital-scurf.org/files/libgfshare/libgfshare-1.0.5.tar.gz')
noextract=()
md5sums=('ec88b5d72183b4d1f7115ee23fa61c7a')

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
