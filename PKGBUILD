# Maintainer: Dan Johansen <strit@strits.dk>
# Contributor: Marcus Britanicus


pkgname=libarchive-qt
pkgver=2.0.8
pkgrel=1
pkgdesc="A Qt based archiving solution with libarchive backend"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/marcusbritanicus/$pkgname"
license=('LGPL3')
depends=('libarchive' 'qt5-base' 'zlib' 'bzip2' 'xz')
makedepends=('meson')
source=("https://gitlab.com/marcusbritanicus/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('99836064f62c6d2cae28c1e3e606541b')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}
  arch-meson ../build
  meson compile -C ../build
}

package() {
  cd ${pkgname}-v${pkgver}
  DESTDIR="${pkgdir}" meson install -C ../build
}
