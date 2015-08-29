# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=cloudfuse
pkgver=1.0
pkgrel=1
pkgdesc="Filesystem (fuse) implemented on Mosso's Cloud Files"
url="http://redbo.github.io/cloudfuse/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('fuse' 'libxml2')
source=("https://github.com/redbo/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('22044dcd78ba0643bbcc9189ce58b9a064dd20c3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make ${MAKEFLAGS}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

