# Maintainer: aksr <aksr at t-com dot me>
pkgname=oh-git
pkgver=r956.6ae1704
pkgrel=1
epoch=
pkgdesc="A surprisingly powerful Unix shell."
arch=('i686' 'x86_64')
url="https://github.com/michaelmacinnis/oh"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('oh')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/michaelmacinnis/oh

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/oh "$pkgdir/usr/bin/oh"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

