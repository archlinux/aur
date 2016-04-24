# Maintainer: aksr <aksr at t-com dot me>
pkgname=execline-git
pkgver=2.1.5.0.r0.g66db04e
pkgrel=1
epoch=
pkgdesc="An interpreter-less scripting language."
arch=('i686' 'x86_64')
url="http://skarnet.org/software/execline/"
license=('ISC')
groups=()
depends=('skalibs')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://git.skarnet.org/execline")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"
}

