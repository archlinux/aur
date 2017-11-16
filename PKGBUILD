# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=mtime-utils

_projname="$(echo "${pkgname}" | tr '-' '_')"

pkgver=1.1.1
pkgrel=1
pkgdesc="A collection of tools for accessing and working with mtime (modification time) and other stat properties"
arch=('i686' 'x86_64')
license=('LGPLv3')
url="https://github.com/kata198/mtime_utils"
source=("https://github.com/kata198/${_projname}/archive/${pkgver}.tar.gz")
sha512sums=("84c7dad00ad0a00a29603b0464f8ba31c61185f2885c99bddf5196dde1feac2884acdc9bdb53ef5c574af2049de6c6aa892e5f542a44b2013a0989230b4b2f81")

build() {
  cd "$srcdir/${_projname}-$pkgver"
  make V=1
}

package() {
  cd "$srcdir/${_projname}-$pkgver"
  make install DESTDIR="${pkgdir}/usr"
}
