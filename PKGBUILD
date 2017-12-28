# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.3.4
pkgrel=4
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus/wiki'
license=('LGPL')
depends=('python2-pyenchant' 'ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha256sums=('33b4f51337fb633a1d5c476a7ec459670a51285f8658d74a5db98ed3c8c706f5')

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
