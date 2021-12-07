# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
pkgname=safesignidentityclient
pkgver=3.6.0.0
pkgrel=1
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://www.uziregister.nl/uzi-pas/documenten/publicaties/2020/09/02/safesign-version-3.5.6.1-for-linux"
license=('custom:copyright')
depends=('pcsclite' 'wxgtk2' 'openssl-1.0' 'xdg-utils' 'libmspack' 'ccid')
optdepends=('acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_x86_64=("https://certificaat.kpn.com/files/drivers/SafeSign/SafeSign%20IC%20Standard%20Linux%20$pkgver-AET.000%20ub2004%20$arch.deb")
sha256sums_x86_64=('c8933b1dacd0f919241cc94084babb070eed04bbcb4bc405128b143bd1afefad')

prepare() {
  tar xvf data.tar.xz
}

package() {
  cp -R ${srcdir}/usr ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
