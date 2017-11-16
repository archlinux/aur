# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=mtime-utils

_projname="$(echo "${pkgname}" | tr '-' '_')"

pkgver=1.1.2
pkgrel=1
pkgdesc="A collection of tools for accessing and working with mtime (modification time) and other stat properties"
arch=('i686' 'x86_64')
license=('LGPLv3')
url="https://github.com/kata198/mtime_utils"
source=("https://github.com/kata198/${_projname}/archive/${pkgver}.tar.gz")
sha512sums=("74a135fc1555b7bcdeb7aec402f971b6ae593c53149c90823c7d299264eb1d90353fbc6dbd4c73471e3c14c5097e704c3f0c036d58f9f65b7fb5536e893e15dc")

build() {
  cd "$srcdir/${_projname}-$pkgver"
  make V=1
}

package() {
  cd "$srcdir/${_projname}-$pkgver"
  make install DESTDIR="${pkgdir}/usr"
}
