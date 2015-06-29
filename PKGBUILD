# Maintainer: aksr <aksr at t-com dot me>
pkgname=ctxt-git
pkgver=0.r97.fdfa0cc
pkgrel=1
epoch=
pkgdesc="A simple markup processor around html, troff, and latex, converts plain text to other formats."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
url="http://repo.or.cz/w/ctxt.git"
license=('custom:BSD')
groups=()
depends=('')
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
source=("$pkgname::git://repo.or.cz/ctxt.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ctxt $pkgdir/usr/bin/ctxt
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

