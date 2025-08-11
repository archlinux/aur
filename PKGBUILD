# Maintainer: moxiu <moxiu3310ud4@proton.me>

pkgname=r34-go
pkgver=1.2.0
pkgrel=1
pkgdesc="Rule34.xxx CLI downloader written in Go"
arch=('x86_64')
url="https://github.com/moxi-git/r34-go"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/moxi-git/r34-go.git")
sha256sums=('SKIP') # Git source, skip sha256

prepare() {
  cd "$srcdir/r34-go"
  # Add patches if needed here
}

build() {
  cd "$srcdir/r34-go"
  go mod tidy
  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o r34-go
}

package() {
  install -Dm755 "$srcdir/r34-go/r34-go" "$pkgdir/usr/bin/r34-go"
}
