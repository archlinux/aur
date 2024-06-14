# Maintainer: sg <velocity_abstract275@simplelogin.com>

pkgname=kpxcpc-git
pkgver=latest
pkgrel=2
pkgdesc="A non-featureful KeePassXC-proxy command line client"
arch=('x86_64')
url="https://gitlab.com/nwwdles/kpxcpc"
license=('MIT')
makedepends=('go' 'git')

build() {
  export GOPATH="$srcdir"
  export PATH="$GOPATH/bin:$PATH"
  git clone https://gitlab.com/nwwdles/kpxcpc.git kpxcpc
  cd ./kpxcpc
  go install
}

package() {
  install -Dm755 "$GOPATH/bin/kpxcpc" "$pkgdir/usr/bin/kpxcpc"
}
