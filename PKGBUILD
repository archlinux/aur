# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.2.1
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsperf"
license=('Apache')
depends=('bind')
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c073e391e681625eb8c7f308a5940435f8e2ec53f615b4e259625024e270dc5c')
sha512sums=('d7b563d5ac7eaf2300f03a805618fe557cea6e63ee9985d68ab8c33adc4963609720b89407010c850ccc71c613438205fff3107aa0ec0b3b0d0fb24817911fb4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

