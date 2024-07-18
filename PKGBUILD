# Maintainer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=any-proxy-git
pkgver=r107.9724c56
pkgrel=1
pkgdesc="A transparent proxy written in Golang"
url="https://github.com/ryanchapman/go-any-proxy"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/ryanchapman/go-any-proxy")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/go-any-proxy"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/go-any-proxy"

  ./make.bash
}

package() {
  cd "$srcdir/go-any-proxy"

  #Install binaries
  install -Dm755 any_proxy "$pkgdir/usr/bin/anyproxy"
}
