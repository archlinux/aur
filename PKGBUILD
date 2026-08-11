# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Axel Gembe <derago@gmail.com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.16.0
pkgrel=1
pkgdesc='Tools that gather accurate latency and throughput metrics for the Domain Name Service (DNS)'
arch=('x86_64')
url='https://www.dns-oarc.net/tools/dnsperf'
license=('Apache-2.0')
depends=('ldns' 'libck' 'libnghttp2' 'json-c')
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6bccbd6949a4616442fdabb8a93d20011f5fbc2e5492d467e612a16aa39426e2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
