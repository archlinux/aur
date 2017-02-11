# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.1.0.0
_pkgsubver=1
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('i686' 'x86_64')
url="http://www.nominum.com/support/measurement-tools/"
license=('GPL')
depends=('bind')
source=("ftp://ftp.nominum.com/pub/nominum/dnsperf/${pkgver}/dnsperf-src-${pkgver}-${_pkgsubver}.tar.gz")
sha512sums=('5571bd0855aba4affcdf81724919e60ab6762d646f8d9a6abf177a2a588675c636842f2fb708bf648004b9c411e9c9b68789f7c6bbbd87afc24c8299a21aa6c9')

build() {
  cd "${srcdir}/${pkgname}-src-${pkgver}-${_pkgsubver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-src-${pkgver}-${_pkgsubver}"
  make DESTDIR="${pkgdir}" install
}

