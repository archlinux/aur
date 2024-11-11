pkgname=go-do-it
_pkgname=go-do-it
pkgver=1.0.0.r0.gc5893de
pkgrel=1
pkgdesc="A simple to-do list written in go"
arch=('i686' 'x86_64')
url='https://github.com/hardikkum444/go-do-it'
source=('git+https://github.com/hardikkum444/go-do-it')
makedepends=('go')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$_pkgname"
  GO111MODULE=on go build -o "$srcdir/bin/go-do-it"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'go-do-it' "$pkgdir/usr/bin/go-do-it"
}
