# Contributor: Alex <einfachnuralex> Predeschly <einfachnuralex_AT_gmx_DOT_net>
# Maintainer: SanskritFritz (gmail)

pkgname=wdfs
pkgver=1.4.2
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="A webdav filesystem based on FUSE"
url="http://noedler.de/projekte/wdfs/"
license=('GPL')
depends=('fuse' 'neon')
source=(http://noedler.de/projekte/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('628bb44194d04c1cf8aacc446ed0a230')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  LDFLAGS='-lpthread' ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

