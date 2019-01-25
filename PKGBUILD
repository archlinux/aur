# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.2.0
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsperf"
license=('Apache')
depends=('bind')
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('283e869435111a5a0f2eefe9cf520bc5a565176830bac7fcb0e2855ba87e317d')
sha512sums=('6c545eff6c4838cea954c5bda9489b9d1ab6bd3013f2e9468c901a8dd5d35bd9e141c5d271820e4f963cad0abc57cc2e85da7a408b20f4587dc205f5dbbe52eb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

