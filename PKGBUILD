# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=acmetool-bin
pkgver=0.0.67
pkgrel=1
pkgdesc="An easy-to-use command line tool for automatically acquiring certificates from ACME servers - Precompiled cgo binary from official repository"
arch=('x86_64')
url="https://github.com/hlandau/acme"
license=('MIT')
provides=('acmetool')
conflicts=('acmetool' 'acmetool-git')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/hlandau/acme/releases/download/v${pkgver}/acmetool-v${pkgver}-linux_amd64_cgo.tar.gz")
sha512sums=('6502616e9bc7ba8905774158b7a007a929ca67ceb6559bce27dbf162ceb38b23424d2c7ee2a89ca9b51575e292b1e4f157d72c48b4d8bd1039dabbd4ef313978')

package() {
  # add bin
  cd "${srcdir}/acmetool-v${pkgver}-linux_amd64_cgo"
  install -Dm755 bin/acmetool "${pkgdir}/usr/bin/acmetool"
  # TODO: add man page
}
