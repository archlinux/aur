# Contributor: Andrej Nandaromovszij <sorosj@gmail.com>
# Contributor: Marshall Conover <marzhall <dot> o <at> gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=drawterm-hg
pkgrel=2
pkgver=112.b4e2f62f737e
pkgdesc="Terminal emulation program for connecting to Plan 9 CPU servers."
arch=('i686' 'x86_64')
url="http://swtch.com/drawterm"
license=('Custom')
groups=()
depends=('xorg-server')
makedepends=('make' 'gcc' 'mercurial')
source=("$pkgname::hg+https://bitbucket.org/rsc/drawterm")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd "$srcdir/$pkgname"
  CONF=unix make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 drawterm $pkgdir/usr/bin/drawterm
  install -Dm644 drawterm.ico $pkgdir/usr/share/pixmaps/drawterm.ico
}

