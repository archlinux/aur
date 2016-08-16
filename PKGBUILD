# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=boarpig-brainfuck
pkgver=0.1
pkgrel=1
pkgdesc='Brainfuck interpreter (bpf)'
arch=('x86_64' 'i686')
url='https://github.com/boarpig/brainfuck'
license=('unknown')
makedepends=('go' 'git')
source=("git://github.com/boarpig/brainfuck#commit=8ac6")
md5sums=('SKIP')

prepare() {
  cd brainfuck

  GOPATH="$srcdir" go get -d
}

build() {
  cd brainfuck

  GOPATH="$srcdir" go build
}

package() {
  cd brainfuck

  install -Dm755 brainfuck "$pkgdir/usr/bin/bpf"
}

# vim:set ts=2 sw=2 et:
