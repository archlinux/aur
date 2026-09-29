# Maintainer: Nicola Mori (nicolamori at aol dot com)
# Original PKGBUILD from: Francesco "Blazer78" (floydthebarber78 at alice dot it)

pkgname=infocertsign
pkgver=3.1.5
pkgrel=1
pkgdesc="InfoCert Sign - software per firma digitale"
arch=('x86_64')
url="https://rinnovofirma.infocert.it"
license=('custom' 'Proprietary')
depends=('nss' 'libxss' 'libxtst' 'gtk3' 'alsa-lib')
source=("InfoCertSign-installer-linux.deb::https://rinnovofirma.infocert.it/infocertsign/download/linux/latest")
sha256sums=('4975b3e18ea3aef0da75df55f82d7267f599e0ae8f7d51c0b414de260e89520c')

options=('!strip' '!debug')
replaces=('gosign')

package() {
  cd "${srcdir}"
  bsdtar -xf InfoCertSign-installer-linux.deb data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"
}
