# Maintainer: aksr <aksr at t-com dot me>
pkgname=rlcmp-git
pkgver=1.0.0.r6.g53a0abf
pkgrel=1
epoch=
pkgdesc="Recursive file compare tool"
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/rlcmp"
license=('GPL')
groups=()
depends=('libavlbst-git')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('rlcmp')
conflicts=('rlcmp')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/rlcmp.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make INCDIR=/usr/include LIBDIR=/usr/lib 
}

package() {
  cd "$srcdir/$pkgname"
  make BINDIR=$pkgdir/usr/bin \
       MANDIR=$pkgdir/usr/share/man \
       INCDIR=$pkgdir/usr//include \
       LIBDIR=$pkgdir/usr/lib install

}

