# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatld-git
pkgver=r48.75d5b1f
pkgrel=1
epoch=
pkgdesc="A simple ARM/x86(_64) static linker."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/ld.git"
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
source=("$pkgname::git+http://repo.or.cz/ld.git")
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
  install -Dm755 nld $pkgdir/usr/bin/nld
}

