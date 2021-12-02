pkgname=git-xargs
_pkgname=git-xargs
pkgver=0.0.13
pkgdesc='git-xargs is a command-line tool (CLI) for making updates across multiple Github repositories with a single command.'
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/gruntwork-io/git-xargs'
source=("https://github.com/gruntwork-io/git-xargs/archive/refs/tags/v${pkgver}.tar.gz")
depends=()
makedepends=('go')
b2sums=('e76c6fb48f7bf30019e9041a95f320c27f0cb3ca6b84157b7c6cf6b29e0cb8f0713b5c844e3b45c56d4c84496310e125d407c38ae0a4d370946ec31e2a9a7e11')
license=('Apache')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  GO111MODULE=on go build -o "$srcdir/bin/git-xargs"
}

package() {
  cd "$srcdir/bin"
  install -Dm755 'git-xargs' "$pkgdir/usr/bin/git-xargs"
}
