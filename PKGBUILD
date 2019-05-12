# Maintainer: Mark Weiman <mark.weiman@markzz.com>

pkgname=bgpstream
pkgver=1.2.3
pkgrel=1
pkgdesc="An open-source software framework for live and historical BGP data analysis, supporting scientific research, operational monitoring, and post-event analysis"
arch=('x86_64')
url="https://bgpstream.caida.org"
license=('GPL')
depends=("libwandio>=1.0.3")
makedepends=('sqlite3')
optdepends=("sqlite3: sqlite data interface")
source=("http://bgpstream.caida.org/bundles/caidabgpstreamwebhomepage/dists/${pkgname}-${pkgver}.tar.gz")
md5sums=('53a2b2341177308a84969a7cb4c842a6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --with-sqlite
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
