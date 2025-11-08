# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.3.3
pkgrel=1
pkgdesc='Flexible yay cache cleaning'
arch=('x86_64')
url='https://github.com/aokellermann/yaycache'
license=('GPL')
depends=(pacman-contrib)
makedepends=('asciidoc' 'git')
optdepends=('sudo: privilege elevation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('bd6fd4f4e21e04c3eeb305e6d7fb6221a39b8c5da61585230f349849e712f44e2366a16500fc9408851fee7f1d8a2651aade970dc2c74d3dd55a532064fc92a8')

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
