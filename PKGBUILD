# Maintainer: aksr <aksr at t-com dot me>
pkgname=dlcall-git
pkgver=r9.473a627
pkgrel=1
epoch=
pkgdesc="Call standard library functions from the command line"
arch=('i686' 'x86_64')
url="https://github.com/mwh/dlcall"
license=('GPLv3')
categories=()
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
source=("$pkgname::git+$url")
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
  install -Dm755 dlcall $pkgdir/usr/bin/dlcall
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

