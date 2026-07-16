# Maintainer: Ahmad Mekkawi <mekky16 at proton dot me>
# Contributor: Sandro Kalbermatter <info dot kalsan [ät-symbol] valaiscom dot ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon at thesquareplanet dot com>

pkgname=memtier_benchmark
pkgver=2.5.1
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/redis/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion' 'openssl')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/redis/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('9b34e17a0d1d7e70b152eb442c6362161b5b764ce2ea98e97b7c74815bdd90b7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
