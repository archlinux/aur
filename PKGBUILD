# Maintainer: Maik Broemme <mbroemme@libmpq.org>
pkgname="asterisk-g72x"
pkgdesc="G.729 and G.723.1 codecs for Asterisk open source PBX"
pkgver=1.3
pkgrel=1
arch=("i686" "x86_64")
url="http://asterisk.hosting.lv/"
license=("IPP")
depends=("asterisk" "bcg729")
source=(
  "http://asterisk.hosting.lv/src/asterisk-g72x-${pkgver}.tar.bz2"
)
sha256sums=(
  "fcfe8f909dab520b15f923ad67856ae81face5ddd5cbea5450fe2b4422e27e15"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --with-bcg729 --with-asterisk130
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
