# Maintainer: Tom Braack <me@shorez.de>

pkgname=gh
pkgver=0.5.4
pkgrel=0
pkgdesc="The GitHub CLI"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://github.com/cli/cli"
makedepends=('go')
depends=('git')
provides=(gh)
license=('MIT')
source=("git+https://github.com/cli/cli#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/cli"
  unset LDFLAGS
  make bin/gh
}

package() {
  install -Dm755 "$srcdir/cli/bin/gh" -t "$pkgdir/usr/bin/"
}
