# Maintainer: Nicola Mori (nicolamori at aol dot com)
# Original PKGBUILD from: Francesco "Blazer78" (floydthebarber78 at alice dot it)

pkgname=infocertsign
pkgver=3.0.0
pkgrel=1
pkgdesc="InfoCert Sign - software per firma digitale"
arch=('x86_64')
url="https://rinnovofirma.infocert.it"
license=('custom' 'Proprietary')
depends=('nss' 'libxss' 'libxtst' 'gtk3' 'alsa-lib')
source=("InfoCertSign-installer-linux.deb::https://rinnovofirma.infocert.it/infocertsign/download/linux/latest")
sha256sums=('592aa52e70b4965920ca3aa6a743136a8b35c6d043529b91d9ab711c61cd3893')
options=('!strip' '!debug')
replaces=('gosign')

package() {
  cd "${srcdir}"
  bsdtar -xf InfoCertSign-installer-linux.deb data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"
}
