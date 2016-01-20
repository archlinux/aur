# Maintainer: Dylan <dylan@psilly.com>

pkgname=('playform')
pkgver=0.0.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://playformdev.blogspot.ca/'
makedepends=('cargo' 'libgl' 'libpng' 'sdl2' 'sdl2_ttf' 'nanomsg')
license=('MIT')
_git_branch=master
source=(
    https://github.com/bfops/$pkgname/archive/$_git_branch.tar.gz
)
sha256sums=(
    SKIP
)

build() {
  cd $srcdir/$pkgname-$_git_branch/client/bin
  cargo build --release
}

package_playform() {
  pkgdesc='Playform is an open-world sandbox game written in Rust'
  depends=('libgl' 'libpng' 'sdl2' 'sdl2_ttf' 'nanomsg')
  cd $srcdir/$pkgname-$_git_branch
  install -Dm755 client/bin/target/release/client $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE '$pkgdir/usr/share/licenses/$pkgname/LICENSE'
}

