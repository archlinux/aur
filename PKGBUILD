# Maintainer: Nicola Mori (nicolamori at aol dot com)
# Original PKGBUILD from: Francesco "Blazer78" (floydthebarber78 at alice dot it)

pkgname=infocertsign
pkgver=3.1.2
pkgrel=1
pkgdesc="InfoCert Sign - software per firma digitale"
arch=('x86_64')
url="https://rinnovofirma.infocert.it"
license=('custom' 'Proprietary')
depends=('nss' 'libxss' 'libxtst' 'gtk3' 'alsa-lib')
source=("InfoCertSign-installer-linux.deb::https://rinnovofirma.infocert.it/infocertsign/download/linux/latest")
sha256sums=('05fcca504f1c2da4fd47f4b2224486bc92f042554002db69529ff65310ae86ba')

options=('!strip' '!debug')
replaces=('gosign')

package() {
  cd "${srcdir}"
  bsdtar -xf InfoCertSign-installer-linux.deb data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"
}
