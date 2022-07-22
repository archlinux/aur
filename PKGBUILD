pkgname=git-xargs
_pkgname=git-xargs
pkgver=0.1.0
pkgdesc='git-xargs is a command-line tool (CLI) for making updates across multiple Github repositories with a single command.'
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/gruntwork-io/git-xargs'
source=("https://github.com/gruntwork-io/git-xargs/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('fbecd02c17b6e4dfe954590848c781572aa98503eed0ddca6b207492bdd284177baa6e0810290202e50b403484ea5b38b512cee6f1660e543cddbd8345e7f963')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/git-xargs"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'git-xargs' "$pkgdir/usr/bin/git-xargs"
}
