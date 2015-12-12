# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Original maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=watchman
pkgver=4.2.0
pkgrel=1
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('glibc' 'pcre')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebook/watchman/archive/v${pkgver}.tar.gz")
sha256sums=('d8998df9795951d49dce9df82da11eeba384934d5d9d3f0ea2d543a9837e2ddb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --without-python
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
