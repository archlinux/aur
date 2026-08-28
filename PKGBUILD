# Maintainer: robertfoster

pkgname=ndpi
pkgver=6.0 # renovate: datasource=github-tags depName=ntop/nDPI
pkgrel=1
pkgdesc="Open and Extensible Deep Packet Inspection Library"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ndpi/"
license=('LGPL-3.0-or-later')
conflicts=('ndpi-svn')
depends=('libcap')
makedepends=('json-c' 'libmaxminddb' 'libpcap' 'numactl' 'pcre2' 'rrdtool')
source=("https://github.com/ntop/nDPI/archive/${pkgver}.tar.gz")

build() {
  cd "${srcdir}/nDPI-${pkgver}"
  unset CPPFLAGS
  ./autogen.sh
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd "${srcdir}/nDPI-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('21fc40cab5505942c0b21d9bbaf73e9adf8162ddfe782e4cd072cab855a2eda9')
