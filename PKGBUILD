# Maintainer: aksr <aksr at t-com dot me>
pkgname=videoteco-fork-git
pkgver=r27.415ef16
pkgrel=1
epoch=
pkgdesc="A text editing program."
arch=('i686' 'x86_64')
url="http://www.copters.com/teco.html"
url="https://github.com/rhaberkorn/videoteco-fork"
license=('GPL')
groups=()
depends=('ncurses')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('videoteco')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://github.com/rhaberkorn/videoteco-fork.git")
noextract=()
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 teco $pkgdir/usr/bin/videoteco
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

