# Maintainer: 4rkal <4rkal@horsefucker.org>
pkgname=discord-webview
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple webview application to access discord, without having spyware running in the background"
arch=('x86_64')
url="https://git.4rkal.com/4rkal/discord-desktop"
license=('MIT')
depends=('glibc' 'webkit2gtk')
makedepends=('go')
source=("main.go")
sha256sums=('d41ca58419d1ec0e668d77c521297174b463c51358a4e9d25fa40f84d251827b')

build() {
  cd "$srcdir"

  export GOPATH="$srcdir"
  export GO111MODULE=on

  go build -o "$srcdir/$pkgname" main.go
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 main.go "$pkgdir/usr/share/$pkgname/main.go"
}
