# Maintainer: Mark Weiman <mark.weiman@markzz.com>

pkgname=bgpstream
pkgver=2.1.0
pkgrel=1
pkgdesc="An open-source software framework for live and historical BGP data analysis, supporting scientific research, operational monitoring, and post-event analysis"
arch=('x86_64')
url="https://bgpstream.caida.org"
license=('GPL')
depends=("libwandio>=1.0.3" "librdkafka")
makedepends=('sqlite3' 'git')
optdepends=("sqlite3: sqlite data interface")
source=("https://github.com/CAIDA/libbgpstream/releases/download/v${pkgver}/libbgpstream-${pkgver}.tar.gz")
md5sums=('19fdcc3514fbd639a2ea5ea0b154a6f4')

build() {
  cd "${srcdir}/libbgpstream-${pkgver}"
  ./configure --prefix=/usr --with-sqlite
  make
}

package() {
  cd "${srcdir}/libbgpstream-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
