pkgname=git-xargs
_pkgname=git-xargs
pkgver=0.1.4
pkgdesc='git-xargs is a command-line tool (CLI) for making updates across multiple Github repositories with a single command.'
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/gruntwork-io/git-xargs'
source=("https://github.com/gruntwork-io/git-xargs/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('0c60f400fa3a3629c98f9175ddf56a19270d8423d15a401e3f8cf7b8907d226f5dcc6836d7a64d46c9f924dacc2630df6583e1b7ca7819f14d060e80a7ca9bd3')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/git-xargs"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'git-xargs' "$pkgdir/usr/bin/git-xargs"
}
