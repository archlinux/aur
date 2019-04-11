# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
pkgname=safesignidentityclient
pkgver=3.5
pkgrel=3
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://pronova.com.br/download-tokens"
license=('custom:copyright')
depends=('pcsclite' 'gdbm183' 'wxgtk2' 'openssl-1.0' 'xdg-utils' 'libmspack' 'ccid')
optdepends=('acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_x86_64=("http://www.pronova-usa.com/downloads/aet/SafeSign_3_5_Ubuntu_1604LTS_x86_x64.zip")
sha512sums_x86_64=('d56bb7f8918a9d488597389e95f032181cb9e356e245406a672fe8fc899153f664bc6ec620b0d166c2340ff2c5a7259c837e0ce762c6a615da6e253e7f461fe0')

prepare() {
  ar x SafeSign_IC_Standard_Linux_3.5.0.0_Ubuntu_1604LTS_x86_64.deb
  tar xvf data.tar.xz
}

package() {
  cd ${pkgdir}

  cp -R ${srcdir}/usr ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
