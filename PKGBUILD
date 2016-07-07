# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributors: bhushan, huma, adlaiff6, Invie, solarce

pkgname='tmate'
pkgver='2.2.1'
pkgrel='1'
pkgdesc='Instant Terminal Sharing'
arch=('i686' 'x86_64')
url='http://tmate.io/'
license=('BSD')
makedepends=('cmake' 'libevent' 'ncurses' 'openssl' 'zlib' 'ruby'
             'msgpack-c')
source=("https://github.com/tmate-io/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d9c2ac59f42e65aac5f500f0548ea8056fd79c9c5285e5af324d833e2a84c305')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
