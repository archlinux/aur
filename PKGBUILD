# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
pkgname=safesignidentityclient
pkgver=3.7.0.0
pkgrel=1
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://safesign.gdamericadosul.com.br/download"
license=('custom:copyright')
depends=('pcsclite' 'wxwidgets3.0' 'openssl-1.0' 'xdg-utils' 'libmspack' 'ccid')
optdepends=('acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
_aet_version="AET.000_ub2004"
source_x86_64=("https://safesign.gdamericadosul.com.br/content/SafeSign_IC_Standard_Linux_${pkgver}_${_aet_version}_${arch}.rar")
sha256sums_x86_64=('cc250d03260d5d2af551c86f8e392452d55a8603426114bd7aabcaef04a3c85c')

prepare() {
  ar -x SafeSign_IC_Standard_Linux_${pkgver}_${_aet_version}_${arch}.deb
  tar xvf data.tar.xz
}

package() {
  cp -R ${srcdir}/usr ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
