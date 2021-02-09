# Maintainer: Axel Gembe <derago@gmail.com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.4.1
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsperf"
license=('Apache')
depends=('bind')
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3debcc95c2e70b5fe866b0f1eacf3d0f586fff2f3083e97247420b2f08e772e5')
sha512sums=('a2c426cf06eac13d96c32a07fb1051a61510067fd287929861fd5c4b159f12396c774f193ba5ce89ea0c9a81396c0db60a22919bad17c4cc3fbae06a8bfb640f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

