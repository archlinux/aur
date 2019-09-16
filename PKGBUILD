# Maintainer: Marcus Britanicus
# Contributor: Dan Johansen <strit@manjaro.org>

pkgname=libarchive-qt
pkgver=1.0.2
pkgrel=2
pkgdesc="A Qt based archiving solution with libarchive backend."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/marcusbritanicus/$pkgname"
license=('LGPL-3.0')
depends=('libarchive' 'qt5-base' 'zlib' 'bzip2' 'xz')
groups=('coreapps')
source=("https://gitlab.com/marcusbritanicus/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('f8bfc8db69ae2fe7dd1f689e71178235')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
} 
