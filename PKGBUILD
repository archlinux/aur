# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=ccollab-client
pkgver=8_4_8406
pkgrel=1
pkgdesc="Collaborator Client"
arch=('any')
url="https://smartbear.com/product/collaborator"
license=('custom')
depends=('java-runtime')
source=("https://s3.amazonaws.com/backups.smartbear/downloads/${pkgname//-/_}_${pkgver}_unix.tar.gz")
sha256sums=('0f4e340a9cf631906d4bd2c8e88533a6590f5f0f091cb8046028e25f50b5f1d7')

package() {
  mkdir -p "${pkgdir}/opt"
  cp -R "${srcdir}/${pkgname}" "${pkgdir}/opt/"

  rm -f "${pkgdir}/opt/${pkgname}/ssdiff.exe"
  rm -f "${pkgdir}/opt/${pkgname}/diffmerge_3.0.2.1010-1ubuntu610_i386.deb"
  rm -f "${pkgdir}/opt/${pkgname}/diffmerge_3.0.2.1010-1ubuntu610_i386.README.txt"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/${pkgname}/ccollab" "${pkgdir}/usr/bin/ccollab"
  ln -s "/opt/${pkgname}/ccollabgui" "${pkgdir}/usr/bin/ccollabgui"
}
