# Maintainer: Max Struebing mxstrbng@gmail.com

pkgname=tldr-go-client-git
pkgver=1.1.1
pkgrel=1
pkgdesc="fast TLDR client written in Golang"
arch=(any)
url="https://github.com/mstruebing/tldr"
license=('MIT')
depends=()
makedepends=('git' 'make' 'go')
source=("git+$url")
md5sums=('SKIP')
provides=('tldr')

build() {
    cd "$srcdir/$(basename $url)" 
    make build
}

package() {
    cd "$srcdir/$(basename $url)/bin" 
    install -Dm755 tldr "$pkgdir/usr/bin/tldr"
}
