# Maintainer: Marcus Britanicus
# Contributor: Dan Johansen <strit@manjaro.org>

pkgname=libarchive-qt
pkgver=1.1.1
pkgrel=1
pkgdesc="A Qt based archiving solution with libarchive backend."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/marcusbritanicus/$pkgname"
license=('LGPL-3.0')
depends=('libarchive' 'qt5-base' 'zlib' 'bzip2' 'xz')
groups=('coreapps')
source=("https://gitlab.com/marcusbritanicus/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('53f80fad603b178666ffc77a18012334')

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
