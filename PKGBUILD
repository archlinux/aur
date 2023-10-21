# Maintainer: Denis A. Altoé Falqueto <denisfalqueto@gmail.com>
# Contributor: Geyslan G. Bem <geyslan@gmail.com>
pkgname=safesignidentityclient
pkgver=4.0.0.0
pkgrel=1
pkgdesc="Smart card PKCS#11 provider and token manager"
arch=('x86_64')
url="https://safesign.gdamericadosul.com.br/download"
license=('custom:copyright')
depends=('gcc-libs' 'glib2' 'glibc' 'hicolor-icon-theme' 'pcsclite' 'libsm' 'libx11' 'cairo' 'pango'
         'gdk-pixbuf2' 'at-spi2-core' 'gtk3' 'libxxf86vm' 'openssl-1.1' 'gdbm')
optdepends=('ccid: Generic support for CCID devices',
            'acsccid: ACS CCID PC/SC driver',
            'scmccid: binary driver for the SCM Smart Card Readers')
_aet_version="AET.000_ub2004"
source_x86_64=("https://certificaat.kpn.com/files/drivers/SafeSign/SafeSign%20IC%20Standard%20Linux%204.0.0.0-AET.000%20redhat8%20x86_64.rpm")
sha256sums_x86_64=('d78e8757afb61cc19424f2379c9cc7a7f187a096cc5ebb3445ccff3402403776')

package() {
  install -d ${pkgdir}/usr
  cp -R ${srcdir}/usr/{bin,share} ${pkgdir}/usr/

  install -d ${pkgdir}/usr/lib
  install -m 744 ${srcdir}/usr/lib64/* ${pkgdir}/usr/lib/

  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/usr/share/doc/${pkgname}/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
}
