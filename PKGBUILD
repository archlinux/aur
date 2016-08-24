# Maintainer: aksr <aksr at t-com dot me>
pkgname=libavlbst-git
pkgver=1.0.1.r11.gad33847
pkgrel=1
epoch=
pkgdesc="General purpose AVL binary search tree library."
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/libavlbst"
license=('BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('libavlbst')
conflicts=('libavlbst')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/libavlbst.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INCDIR=$pkgdir/usr/include \
       LIBDIR=$pkgdir/usr/lib \
       MANDIR=$pkgdir/usr/share/man install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

