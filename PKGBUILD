# Maintainer: aksr <aksr at t-com dot me>
pkgname=vddiff-git
pkgver=r449.a61dc96
pkgrel=1
epoch=
pkgdesc="Text terminal directory diff tool"
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/vddiff/commits/master"
license=('ISC')
categories=()
groups=()
depends=('libavlbst')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('vddiff')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/n-t-roff/vddiff.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

