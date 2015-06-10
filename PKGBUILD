# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=glua
pkgver=0.1
pkgrel=1
pkgdesc='VM and compiler for Lua'
arch=('x86_64' 'i686')
url='https://github.com/yuin/gopher-lua'
license=('MIT')
makedepends=('go' 'git')
source=("git://github.com/yuin/gopher-lua#commit=6327022d5824a61eccd70f1a3c04b8632621ca6b")
md5sums=('SKIP')

build() {
  export GOPATH="$srcdir"
  go get github.com/yuin/gopher-lua/cmd/glua
}

package() {
  install -Dm755 "bin/glua" "$pkgdir/usr/bin/glua"
  install -Dm644 "src/github.com/yuin/gopher-lua/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
