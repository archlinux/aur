# Contributor: Michael Asher <asherlm  at  gmail dot com> (0.7)
# Contributor: Vyazovoi Pavel <vyazovoi@gmail.com> (0.6.4)
# Maintainer: aksr <aksr at t-com dot me>
pkgname=climm
pkgver=0.7.1
pkgrel=2
epoch=
pkgdesc="A small, text mode ICQ client."
arch=('i686' 'x86_64')
url="http://climm.org"
license=('GPL')
groups=()
depends=('tcl' 'gnutls' 'libotr' 'iksemel')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('climm-svn')
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.climm.org/source/$pkgname-$pkgver.tgz")
noextract=()
md5sums=('37e9692fe778230630aceee2f9feecbf')
sha1sums=('d4220f6d58714ecd312f9dea6015d9ca8e1661d7')
sha256sums=('6212ada46947f0572fb6734b920a2cfd91b6a632cbd044d87476791a318af052')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make all
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

