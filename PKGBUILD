# Maintainer: aksr <aksr at t-com dot me>
pkgname=xdemos-git
pkgver=r36.2cc6fdb
pkgrel=1
epoch=
pkgdesc="xlib animation and cellular automaton demos: press LSHIFT and LCTRL to quit"
arch=('i686' 'x86_64')
url="https://github.com/mar77i/xdemos"
license=('ISC')
categories=()
groups=()
depends=('bulk77i-git')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('${pkgname%-*}')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/mar77i/xdemos.git")
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
  for i in life1d life2d xrootgen; do
    install -Dm755 $i $pkgdir/usr/bin/$i
  done
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

