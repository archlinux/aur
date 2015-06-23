# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=gotemps
pkgver=1
pkgrel=1
pkgdesc="Convert between Fahrenheit and Celsius via the command line using Go."
arch=('x86_64' 'i686')
url="http://github.com/darthlukan/gotemps"
license=('custom')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
source=("git+git://github.com/darthlukan/$pkgname")
sha256sums=("SKIP")

prepare() {
 mkdir -p go
 export GOPATH="$srcdir/go"
 go get github.com/darthlukan/goconvtemps 
}

build() {
  export GOPATH="$srcdir/go"
  cd "$pkgname"

  msg2 'Building gotemps'
  go build -o "$pkgname" main.go

}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
