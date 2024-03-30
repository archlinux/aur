# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=yaycache
pkgver=0.3.1
pkgrel=1
pkgdesc='Flexible yay cache cleaning'
arch=('x86_64')
url='https://github.com/aokellermann/yaycache'
license=('GPL')
depends=(pacman-contrib)
makedepends=('asciidoc' 'git')
optdepends=('sudo: privilege elevation')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('89bdc77af253af90fd015560e9dca438b26da7f9d7a55b36ced164a2643dc4bef1f27c9eb7bcf005427cc72f8819a51a1ab66e6ec3376c44fa8769faaef94432')

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
