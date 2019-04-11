# Maintainer: aksr <aksr at t-com dot me>
pkgname=dsltogls-git
pkgver=r8.9331f27
pkgrel=1
epoch=
pkgdesc="Convert files from DSL to GLS format"
arch=('i686' 'x86_64')
url="https://github.com/Abs62/dsltogls"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'qt5-base')
optdepends=()
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
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
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 dsltogls $pkgdir/usr/bin/dsltogls
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

