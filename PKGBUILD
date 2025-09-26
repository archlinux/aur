# Maintainer: moxiu <moxiu3310ud4@proton.me>

pkgname=gsnake-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="gsnake-cli is just a snake in your terminal lolz"
arch=('x86_64')
url="https://github.com/moxi-git/gsnake-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/moxi-git/gsnake-cli.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/gsnake-cli"
}

build() {
  cd "$srcdir/gsnake-cli"
  go mod tidy
  CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o gsnake
}

package() {
  install -Dm755 "$srcdir/gsnake-cli/gsnake" "$pkgdir/usr/bin/gsnake"
}
