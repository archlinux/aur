# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=profilex
pkgver=0.0.1
pkgrel=1
pkgdesc="ProFileX is a Linux file management tool with a Qt-based GUI."
arch=('x86_64')
url="https://github.com/felipealfonsog/ProFileX"
license=('BSD 3-clause')
depends=('gcc' 'qt5-base')

source=("https://github.com/felipealfonsog/ProFileX/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  tar xf "v${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
  cd "$srcdir"
  gcc -o profilex src/main.c
}

package() {
  cd "$srcdir"
  install -Dm755 profilex "$pkgdir/usr/bin/profilex"
}

sha256sums=('939e1524edda8773745c816514371d1dd5f70610654ec09c2cd72d0aeaa867eb')
