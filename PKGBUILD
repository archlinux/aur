# Maintainer: krion <krionux@gmail.com>
pkgname=goploader-client-git
pkgver=0.1
pkgrel=1
pkgdesc="Simple client-server application to upload files/text"
arch=('i686' 'x86_64')
url="https://github.com/Depado/goploader"
license=('MIT')
depends=()
makedepends=('go')
provides=('goploader')
validpgpkeys=()

prepare() {
  mkdir "$srcdir/go"
  export GOPATH="$srcdir/go"
}

build() {
  cd $GOPATH
  go get github.com/Depado/goploader/client
}

package() {
  cd $GOPATH
  install -Dm755 "$srcdir/go/bin/client" /usr/bin/goploader
}
