# Maintainer: Ahmad Mekkawi <mekky16 at proton dot me>
# Contributor: Sandro Kalbermatter <info dot kalsan [ät-symbol] valaiscom dot ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon at thesquareplanet dot com>

pkgname=memtier_benchmark
pkgver=2.4.2
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/redis/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion' 'openssl')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/redis/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('906163dce897c1d94dbe4611ec0425f709a96d59eb7a42997b838b7c18b2b292')

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
