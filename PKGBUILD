# Maintainer: Felix Fung <fylixeoi@gmail.com>

pkgname=timescaledb
pkgver=1.1.0
pkgrel=0
pkgdesc="An open-source time-series database optimized for fast ingest and complex queries."
arch=('i686' 'x86_64')
url="http://www.timescale.com/"
license=('Apache')
depends=('postgresql<11' 'postgresql>=9.6.0' 'postgresql-libs>=9.6.0')
makedepends=('gcc' 'cmake>=3.4' 'git')
install=${pkgname}.install
source=("$pkgname-$pkgver::git+https://github.com/timescale/timescaledb.git#tag=0.11.0")
md5sums=(SKIP)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./bootstrap
    cd build && make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir/" install
}
