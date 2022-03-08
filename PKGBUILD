pkgname=git-xargs
_pkgname=git-xargs
pkgver=0.0.14
pkgdesc='git-xargs is a command-line tool (CLI) for making updates across multiple Github repositories with a single command.'
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/gruntwork-io/git-xargs'
source=("https://github.com/gruntwork-io/git-xargs/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('03f5294bad8817d3103749ad4565ea38d7b49bccb8d0496bd79eade5cc3f1629a36621b5190bdf98657b7d8aa3b53763e0dd30925094319f450ab02eb608ae90')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/git-xargs"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'git-xargs' "$pkgdir/usr/bin/git-xargs"
}
