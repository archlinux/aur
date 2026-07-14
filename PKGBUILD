# Maintainer: Ahmad Mekkawi <mekky16 at proton dot me>
# Contributor: Sandro Kalbermatter <info dot kalsan [ät-symbol] valaiscom dot ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon at thesquareplanet dot com>

pkgname=memtier_benchmark
pkgver=2.5.0
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/redis/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion' 'openssl')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/redis/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('1cdda9df157d27889fab283641f8c12e019663f2447c842fbed36f57ac3336a4')

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
