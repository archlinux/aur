# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.3.2
pkgrel=1
pkgdesc='Flexible yay cache cleaning'
arch=('x86_64')
url='https://github.com/aokellermann/yaycache'
license=('GPL')
depends=(pacman-contrib)
makedepends=('asciidoc' 'git')
optdepends=('sudo: privilege elevation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('f0f0ef0a0f65daa1c49b3f28121e863496eceefc53844a5d6cb9a8a59da5b79756987d482332b53880dbe761135d687a3726e2305dce361f65b0bd272344b8bf')

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
