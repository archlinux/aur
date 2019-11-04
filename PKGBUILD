# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=bic
pkgver=0.9.1
pkgrel=2
pkgdesc='A C interpreter and API explorer'
arch=('i686' 'x86_64')
url='https://github.com/hexagonal-sun/bic'
makedepends=('gcc' 'automake' 'expect' 'flex' 'autoconf' 'm4' 'libtool' 'readline' 'pkgconf' 'gmp' 'autoconf-archive' 'bison')
license=('GPL2')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('228aee5efe5d569628492d44dff4327d17ad615d60c3a1cf6e645020be30f271')

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
