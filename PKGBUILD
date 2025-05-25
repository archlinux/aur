# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf
pkgver=1.2505.7
pkgrel=1
epoch=1
pkgdesc="Parser for the mconf configuration language"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/mconf"
license=("WTFPL")
makedepends=("go" "git")
source=("git+https://github.com/marzeq/mconf.git#tag=v$pkgver")
md5sums=("SKIP")
provides=("mconf")
conflicts=("mconf-bin")

build() {
  cd "$srcdir/$pkgname"
  go build -o mconf cmd/mconf.go
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 mconf "$pkgdir/usr/bin/mconf"
}

