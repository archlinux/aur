# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbvis-git
pkgver=r21.58caabc
pkgrel=1
epoch=
pkgdesc="A small framebuffer image viewer, it does not use external libraries."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
url="http://repo.or.cz/w/fbvis.git"
license=('custom:BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('fbvis')
conflicts=('fbvis')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://repo.or.cz/fbvis.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 fbvis  $pkgdir/usr/bin/fbvis
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

