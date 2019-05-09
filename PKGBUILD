# Maintainer: aksr <aksr at t-com dot me>
pkgname=miniyacc-git
pkgver=r103.e3827ac
pkgrel=1
epoch=
pkgdesc="A lightweight yacc for C."
arch=('i686' 'x86_64')
url="https://c9x.me/git/miniyacc.git/"
license=('MIT')
groups=()
depends=()
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+git://c9x.me/miniyacc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  gcc yacc.c -o miniyacc
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 miniyacc $pkgdir/usr/bin/miniyacc
  install -D -m644 doc.txt $pkgdir/usr/share/doc/${pkgname%-*}/doc.txt
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

