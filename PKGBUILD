# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.3.1
pkgrel=2
pkgdesc='M17N engine for IBus'
arch=('i686' 'x86_64')
url='http://code.google.com/p/ibus/'
license=('LGPL')
depends=('python-pyenchant' 'ibus' 'm17n-db' 'm17n-lib')
source=("http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('38ff41207518812945c60084deba0080')

build() {
  cd ${pkgname}-${pkgver}

  ./configure  \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
