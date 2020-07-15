# Maintainer: blacktea <blackteahamburger@outlook.com>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=bic
pkgver=1.0.0
pkgrel=1
pkgdesc='A C interpreter and API explorer'
arch=('i686' 'x86_64')
url='https://github.com/hexagonal-sun/bic'
makedepends=('gcc' 'automake' 'expect' 'flex' 'autoconf' 'm4' 'libtool' 'readline' 'pkgconf' 'gmp' 'autoconf-archive' 'bison')
license=('GPL2')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fa5b9e3ffc955220ab825a749f1987a7a0bd268693c1750a1af6cc1802217547')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
