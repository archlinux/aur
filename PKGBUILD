# Maintainer: aksr <aksr at t-com dot me>
pkgname=cwdiff-git
pkgver=r33.cfe9fa2
pkgrel=1
epoch=
pkgdesc="A (w)diff wrapper to support directories and colorize the output."
arch=('i686' 'x86_64')
url="https://github.com/junghans/cwdiff/"
license=('GPL')
groups=()
depends=('wdiff')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('cwdiff')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/junghans/cwdiff")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

