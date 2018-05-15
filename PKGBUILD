# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=duperemove
pkgver=0.11
pkgrel=1
pkgdesc='Btrfs extent deduplication utility'
arch=('x86_64' 'i686')
url='https://github.com/markfasheh/duperemove'
license=('GPL')
depends=('glib2' 'sqlite')
conflicts=('duperemove-git')
source=(https://github.com/markfasheh/duperemove/archive/v$pkgver.tar.gz)
sha512sums=('b1bc2beb92223f9b46f8838e2f983ec763a9dff302f4202a34cc5e10591b985519f0464b6eba566c56872e671ba80583c7fdf4a232325086141d011384a286cf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr SBINDIR=/usr/bin DESTDIR="${pkgdir}" install
}
