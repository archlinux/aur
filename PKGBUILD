# Maintainer: Alex Wiggins <alex . d . wiggins at gmail . com>
# Maintainer: bslackr <brendan at vastactive dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=iscan-plugin-network
_pkgintname=iscan-network-nt
_pkgdlname=iscan-bundle
pkgver=1.1.2
_pkgver=1.1.2-1 # workaround for hyphen in version
_pkgdlver=2.30.4 # download bundle version
pkgrel=15
pkgdesc="Plugin for using Epson scanners with ISCAN over network"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:COPYING.EPSON')
depends=(iscan)
install=iscan-plugin-network.install
source_x86_64=("https://download2.ebz.epson.net/iscan/general/deb/x64/${_pkgdlname}-${_pkgdlver}.x64.deb.tar.gz")
source_i686=("https://download2.ebz.epson.net/iscan/general/deb/x86/${_pkgdlname}-${_pkgdlver}.x86.deb.tar.gz")
b2sums_x86_64=('424a43597b9f367315ff9904d72b0be2b929e249ff94ed343a918a65b14a3e47e93910dae73711c5ad302bd4af74d858bf2ff930ddc7c157e9c61eb2c5639155')
b2sums_i686=('4ed4c5e833fa3d8f7c587a2fa646d2931e041b50b4eb15ba76f62e7970306a62736e11495b7995923e29e5c6f9c5ff49c333918f0131c4d9f9a19b01b7832f82')

prepare() {
  bsdtar -xf ${_pkgdlname}-${_pkgdlver}.*.deb/plugins/${_pkgintname}_${_pkgver}_*.deb
  bsdtar -xf data.tar.gz
  gunzip usr/share/doc/${_pkgintname}/COPYING.EPSON.en.txt.gz
}

package() {
  cp -R usr "$pkgdir"
  install -Dm644 usr/share/doc/${_pkgintname}/COPYING.EPSON.en.txt "$pkgdir"/usr/share/licenses/${pkgname}/COPYING.EPSON
}
