# Maintainer: aksr <aksr at t-com dot me>
pkgname=skalibs-git
pkgver=2.3.10.0.r5.g70697ef
pkgrel=1
epoch=
pkgdesc="A general-purpose low-level C library."
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/skalibs/"
license=('ISC')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('skalibs')
conflicts=('skalibs')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://git.skarnet.org/skalibs")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --datadir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

