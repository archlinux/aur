# Maintainer: Andrew Simmons <agsimmons0 at gmail dot com>

pkgname=nstool
pkgver='1.7.0'
_pkgvermod='-r2'
pkgrel=1
pkgdesc="General purpose read/extract tool for Nintendo Switch file formats."
arch=('x86_64' 'i686')
url="https://github.com/jakcron/nstool"
license=('MIT')
makedepends=('git')
source=("git+https://github.com/jakcron/nstool.git#tag=v${pkgver}${_pkgvermod}")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname}"
  git submodule init
  git submodule update
}

build() {
	cd "$srcdir/${pkgname}"
	make deps
  make
}

package() {
	cd "$srcdir/${pkgname}"
  mkdir -p "$pkgdir/usr/bin"
  cp "./bin/nstool" "$pkgdir/usr/bin"
}
