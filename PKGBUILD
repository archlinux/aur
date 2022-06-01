pkgname=git-xargs
_pkgname=git-xargs
pkgver=0.0.15
pkgdesc='git-xargs is a command-line tool (CLI) for making updates across multiple Github repositories with a single command.'
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/gruntwork-io/git-xargs'
source=("https://github.com/gruntwork-io/git-xargs/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('f2c913c8683e205b2899f040443dae7b1262b6ec046afc7fe2b9a2d5bb85531506aea8918ac12143e7dbab932b27b1f860a7f8ac89a832c9eb2d6118d7dd302c')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/git-xargs"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'git-xargs' "$pkgdir/usr/bin/git-xargs"
}
