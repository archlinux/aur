# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.4.0
pkgrel=1
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus/wiki'
license=('LGPL')
depends=('python2-pyenchant' 'ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('56122b62148c159e238a5b81709d750c1a99f6f60da70c2c832a220a1f5769fa1ccada44451e39a384f4971fc748b42c96fbfa5446c7407934f4d1e7ae8b5285')

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
