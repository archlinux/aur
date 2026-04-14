# Maintainer: KrishnaSSH krishna.pytech@gmail.com
pkgname=gophertube
pkgver=2.8.1
pkgrel=1
pkgdesc="minimal terminal youtube client"
arch=('x86_64' 'aarch64')
url="https://github.com/KrishnaSSH/GopherTube"
license=('GPL3')

makedepends=('go' 'git')

source=("gophertube::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/gophertube"

  export CGO_ENABLED=0

  go build -ldflags "-X gophertube/internal/app.version=$pkgver" -o gophertube .
}

package() {
  cd "$srcdir/gophertube"

  install -Dm755 gophertube "$pkgdir/usr/bin/gophertube"
}
