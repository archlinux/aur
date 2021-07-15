# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
pkgname=safesignidentityclient
pkgver=3.5.6.1
pkgrel=1
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://pronova.com.br/download-tokens"
license=('custom:copyright')
depends=('pcsclite' 'wxgtk2' 'openssl-1.0' 'xdg-utils' 'libmspack' 'ccid')
optdepends=('acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
source_x86_64=("https://www.uziregister.nl/binaries/uziregister/documenten/publicaties/2020/09/02/safesign-version-$pkgver-for-linux/SafeSign+IC+Standard+Linux+$pkgver-AET.000+ub1804+$arch.deb.zip")
sha256sums_x86_64=('3c0c4b40d6026a110e7c4dd91ecd0aca4b44fda0576908e1b93f01ef7fb275d8')

prepare() {
  ar x 'SafeSign IC Standard Linux 3.5.6.1-AET.000 ub1804 x86_64.deb'
  tar xvf data.tar.xz
}

package() {
  cd ${pkgdir}

  cp -R ${srcdir}/usr ${pkgdir}

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
