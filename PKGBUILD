# Maintainer: Michael Niewöhner <foss@mniewoehner.de>

pkgname=tpm-quote-tools
pkgver=1.0.4
pkgrel=1
pkgdesc="Tools for TPM remote attestation"
arch=('x86_64')
url="http://sf.net/projects/tpmquotetools"
license=('BSD')
depends=('trousers')
source=("tpm-quote-tools-${pkgver}.tar.gz::https://sourceforge.net/projects/tpmquotetools/files/${pkgver}/tpm-quote-tools-${pkgver}.tar.gz/download")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
