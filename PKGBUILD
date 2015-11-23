# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatas-git
pkgver=r24.6a3f8d4
pkgrel=1
epoch=
pkgdesc="A simple ARM assembler."
arch=('i686' 'x86_64')
url="http://repo.or.cz/neatas.git"
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
source=("$pkgname::git+git://repo.or.cz/neatas.git")
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
  install -Dm755 neatas "$pkgdir/usr/bin/neatas"
}

