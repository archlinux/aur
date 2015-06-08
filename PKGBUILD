# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gitbrute
pkgver=4
pkgrel=1
pkgdesc="Brute-force a git commit hash"
arch=('x86_64' 'i686')
url='https://github.com/bradfitz/gitbrute'
license=('unknown')
makedepends=('go')
source=("$url/raw/e8909ca1ffc24f36be21a96567f43cde52f67491/gitbrute.go")
sha256sums=('702163a9b6e70d98f09ab92fc949c26360d229a7e6f05c821434ccc1532116d1')
options=('!strip')
provides=('git-brute')

build() {
  go build -o $pkgname
}

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$provides"
}
