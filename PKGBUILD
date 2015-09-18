# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Original maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=watchman
pkgver=3.8.0
pkgrel=0
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
sha256sums=('10d1e134e6ff110044629a517e7c69050fb9e4a26f21079b267989119987b40d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
