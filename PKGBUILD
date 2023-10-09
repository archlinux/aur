# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.2.0
pkgrel=1
pkgdesc='Flexible yay cache cleaning'
arch=('x86_64')
url='https://github.com/aokellermann/yaycache'
license=('GPL')
depends=(pacman-contrib)
makedepends=('asciidoc' 'git')
optdepends=('sudo: privilege elevation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('2d8c447337a3e24695ca5562cd17b04fb5ad9dac4df812251605c9d83685bd46d7fd5d745b382078024d92862a1df4403233a1d2d7c7bcf42b8ffdbced6d0ba3')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
