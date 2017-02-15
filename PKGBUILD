# Contributor: Erik Johnson <palehose at gmail dot com>

pkgname=libucl
pkgver=0.8.0
pkgrel=1
pkgdesc='Universal Config Language'
arch=('i686' 'x86_64')
url='https://github.com/vstakhov/libucl'
license=('BSD')
depends=('glibc')
source=("https://github.com/vstakhov/libucl/archive/${pkgver}.tar.gz")
sha256sums=('af361cd1f0b7b66c228a1c04a662ccaa9ee8af79842046c04446d915db349ee1')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh && ./configure --prefix=/usr --sysconfdir=/etc && make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
