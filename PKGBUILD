# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

pkgname=bluespec-git
pkgver=r3.cc623d8
pkgrel=1
pkgdesc='Bluespec Compiler (BSC)'
arch=('x86_64')
url='https://github.com/B-Lang-org/bsc'
license=('custom')
depends=()
makedepends=('git' 'gperf' 'ghc' 'haskell-regex-compat' 'haskell-syb' 'haskell-old-time' 'fontconfig' 'libxft')
source=("git+https://github.com/B-Lang-org/bsc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/bsc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/bsc"
  git submodule update --init --recursive
}

build(){
  cd "$srcdir/bsc"
  make GHC="ghc -dynamic"
}

package() {
  cd "$srcdir/bsc"
}

