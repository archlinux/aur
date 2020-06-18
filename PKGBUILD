# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.3.4
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsperf"
license=('Apache')
depends=('bind')
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('adcb3ad28ad46ef9ff4a218c67bd5ea9a9dde556b9a277059a1f390ce0f86581')
sha512sums=('ec1df94d9f1c9bc9d439318cfa75f9eea7a8a41c88a411e0678606a3fc4374d1bcc63ce5da606ed4951477d994b440cc2109f2ffc99feddf29bbdfa17f44efd8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

