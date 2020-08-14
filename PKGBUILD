# Maintainer: yjun <jerrysteve1104 at gmail dot com>

pkgname=phddns-bin
_pkgname=${pkgname%-bin}
pkgver=5.0.0
pkgrel=1
pkgdesc="Peanut shell is a dynamic DNS software, any place, any time, any lines, all can through fixed domain access to the remote host services"
arch=("x86_64" "i686")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url="https://hsk.oray.com/download/"
license=('custom')
install='.INSTALL'
source=('LICENSE::https://service.oray.com/question/1820.html')
source_x86_64=("http://dl-cdn.oray.com/hsk/linux/${_pkgname}-${pkgver}-amd64.deb")
source_i686=("http://dl-cdn.oray.com/hsk/linux/${_pkgname}-${pkgver}-i386.deb")

sha256sums=('SKIP')
sha256sums_x86_64=('f27b86a13684212b9e852a6ac20256d9fadf7ca3a402d4f4c5d70530dffd1c1c')
sha256sums_i686=('882aaca32b86d1beb3d0daf3f3bce35ff1eb7500729a3cec48ee3427fb2e8b7b')

package() {
  install -dm755 ${srcdir}/${pkgname}
  tar -xf data.tar.xz -C ${srcdir}/${pkgname}

  # binary
  install -Dm755  -t ${pkgdir}/usr/bin/ ${srcdir}/${pkgname}/usr/bin/phtunnel
  
  # systemd service
  install -Dm644 -t ${pkgdir}/usr/lib/systemd/system/ ${srcdir}/${pkgname}/tmp/pht_script/phtunnel.service
  
  # license
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ ${srcdir}/LICENSE
}    

# vim: ts=2 sw=2 et:  
