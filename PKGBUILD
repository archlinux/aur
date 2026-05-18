# Maintainer: jt <joacotom1721@gmail.com>
pkgname=zenvsh
_upstream=zenv
pkgver=0.1.0
pkgrel=1
pkgdesc="Persistent shell variables for zsh, written in C"
arch=('x86_64')
url="https://github.com/joako1721/zenv"
license=('MIT')
depends=()
makedepends=('gcc')
checkdepends=('zsh')
source=("$_upstream-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('736559089f87cde4b2c746198382c38c821576cb253665c8d5891be5063e629d')

build() {
	cd "$_upstream-$pkgver"
	make PREFIX=/usr
}

check() {
	cd "$_upstream-$pkgver"
	make test
}

package() {
	cd "$_upstream-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
