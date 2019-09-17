# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=dnsperf
pkgver=2.3.2
pkgrel=1
pkgdesc="Tools that measure performance of authoritative Domain Name services"
arch=('x86_64')
url="https://www.dns-oarc.net/tools/dnsperf"
license=('Apache')
depends=('bind')
source=("https://www.dns-oarc.net/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('292bbaeb95389b549a91f4bfc7faf8062326ef75a0382e879ca86cdfe71df408')
sha512sums=('b4fbfa40811174a0613ba333a57278262af2c424118c55ad3f0fe7bf4df07ae4ca4c5fb528ff659d98db61393399308b652bc9887c48ed24427c70343307f06d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

