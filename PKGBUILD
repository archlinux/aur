# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='dmon'
pkgver='0.4.2'
pkgrel='3'
pkgdesc='Toolset for daemonizing and supervising processes'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/aperezdc/dmon'
license=('MIT')
depends=('glibc')
makedepends=('make')
source=("http://people.igalia.com/aperez/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('81c7139862ba8b40996f618cad839628300b97bc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make MULTICALL=1 prefix=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make MULTICALL=1 prefix=/usr DESTDIR="${pkgdir}/" install
}
