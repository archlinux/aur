# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=minder
pkgver=1.8.0
pkgrel=1
pkgdesc='Mind-mapping application'
arch=('i686' 'x86_64')
url='https://github.com/phase1geo/Minder'
license=('GPL3')
depends=('discount'
         'granite'
         'gtksourceview3'
         'libarchive')
makedepends=('ninja' 'python-setuptools' 'meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phase1geo/Minder/archive/${pkgver}.tar.gz")
sha256sums=('0cfa00f75c1f43445965428abb450a6b279276a23e7346b6184ec24086b2aedb')

build() {
  cd "Minder-${pkgver}"
  meson . build --prefix=/usr
  ninja -C build
}

package() {
  cd "Minder-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
# vim:set ts=2 sw=2 et: