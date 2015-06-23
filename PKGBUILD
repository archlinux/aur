# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatvi-git
pkgver=r1.b1c10bc
pkgrel=1
epoch=
pkgdesc="A small ex/vi editor."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/neatvi.git"
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
source=("$pkgname::git+http://repo.or.cz/neatvi.git")
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
  install -Dm755 vi $pkgdir/usr/bin/neatvi
}

