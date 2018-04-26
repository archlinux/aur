# Maintainer: aksr <aksr at t-com dot me>
pkgname=dragon-git
pkgver=r11.595caf8
pkgrel=1
epoch=
pkgdesc="Drag and drop source/target for X"
arch=('i686' 'x86_64')
url="https://github.com/mwh/dragon"
license=('GPLv3')
categories=()
groups=()
depends=('gtk3')
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
source=("$pkgname::git+https://github.com/mwh/dragon.git")
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
  install -Dm755 dragon $pkgdir/usr/bin/dragon
  install -Dm644 LICENCE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 example/download.sh $pkgdir/usr/share/doc/${pkgname%-*}/example/download.sh
}

