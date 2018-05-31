# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.3.4
pkgrel=5
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus/wiki'
license=('LGPL')
depends=('python2-pyenchant' 'ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('9dbb5224fea377293a583e68598b36be4637698af0718c5117434d60b6a398bf94dc8cc2dbeef59c2d43bdab6f50e831bc60dd97112eed02105a3f2b9d55f026')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  autoreconf -fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure  \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
