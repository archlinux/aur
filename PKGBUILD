# Maintainer: aksr <aksr at t-com dot me>
pkgname=drawterm-git
pkgver=r115.8de603b
pkgrel=1
epoch=
pkgdesc="Connect to Plan 9 CPU servers from other operating systems."
arch=('i686' 'x86_64')
url="https://github.com/0intro/drawterm"
license=('LPL' 'MIT')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=('drawterm')
conflicts=('drawterm' 'drawterm-hg')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/0intro/drawterm.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  CONF=unix make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 drawterm $pkgdir/usr/bin/drawterm
  install -Dm644 drawterm.ico $pkgdir/usr/share/pixmaps/drawterm.ico
}

