# Maintainer: SeeSchloss <see@seos.fr>
pkgname=opensmtpd-filter-spamassassin
pkgver=0.7
pkgrel=1
pkgdesc="OpenSMTPD filter for spamassassin"
arch=('x86_64' 'aarch64')
url="https://www.umaxx.net"
license=('ISC')
depends=('glibc')
makedepends=('go')
source=("filter-spamassassin-${pkgver}.tar.gz::https://www.umaxx.net/dl/filter-spamassassin-${pkgver}.tar.gz")
sha256sums=('f15a9e3f2848a3c206c532341729ddb6ca2b5c2f42fa63a79550c6dc34f88605')

build() {
  cd "filter-spamassassin-${pkgver}"
  make
}

package() {
  cd "filter-spamassassin-${pkgver}"

  install -Dm0755 filter-spamassassin "${pkgdir}/usr/lib/smtpd/opensmtpd/filter-spamassassin"
  install -Dm0444 filter-spamassassin.1 "${pkgdir}/usr/share/man/man1/filter-spamassassin.1"
}
