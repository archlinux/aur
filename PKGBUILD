# Maintainer: aksr <aksr at t-com dot me>
pkgname=go-peerflix-git
pkgver=r110.01557ce
pkgrel=1
epoch=
pkgdesc="A Golang port of peerflix."
arch=('i686' 'x86_64')
url="https://github.com/Sioro-Neoku/go-peerflix"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('go-peerflix')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/Sioro-Neoku/go-peerflix

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/go-peerflix "$pkgdir/usr/bin/go-peerflix"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

