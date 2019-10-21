# Maintainer: Poscat <poscat At mail Dot poscat Dot moe>

pkgname=caddy2
pkgver=beta6
pkgrel=1
pkgdesc='Fast, cross-platform HTTP/2 web server with automatic HTTPS'
arch=('x86_64')
license=('Apache')
url='https://github.com/caddyserver/caddy'
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/caddyserver/caddy/archive/v2.0.0-${pkgver}.tar.gz")
sha256sums=('cbcd8ef9eb091c8431e5169c9acfa67f9641d6406a32b383c850bf6429a47182')

build() {
  cd ${srcdir}/caddy-2.0.0-${pkgver}
  export GOPATH="$srcdir"
  go build -v -o caddy cmd/caddy/main.go
  
}

package() {
  cd ${srcdir}/caddy-2.0.0-${pkgver}

  install -D -m 0755 caddy "$pkgdir/usr/bin/caddy"
}

