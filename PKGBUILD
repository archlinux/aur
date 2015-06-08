# Maintainer: Alex Wiggins <alex . d . wiggins at gmail . com>
# Maintainer: bslackr <brendan at vastactive dot com>
# Contributor: Gianni Vialetto <g dot vialetto at gmail dot com>
# Contributor: Brian Miller :
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=iscan-plugin-network
_pkgintname=iscan-network-nt
pkgver=1.1.1
_pkgver=1.1.1-1 # workaround for hyphen in package version
pkgrel=10
pkgdesc="Plugin for using Epson scanners with ISCAN over network"
arch=('i686' 'x86_64')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('custom:AVASYSPL')
depends=(iscan)
install=iscan-plugin-network.install
if [[ ${CARCH} = 'x86_64' ]]; then
    md5sums=('b9fedf56f04b375df85c7d73d43a922d')
    source=("iscan-network-nt.deb::https://download3.ebz.epson.net/dsc/f/03/00/03/61/60/41e00501e67a849926adf271afdb4eb258d0b6b8/${_pkgintname}_${_pkgver}_amd64.deb")
else
    md5sums=('08b6cd88050151892bc582182cc8a2c0')
    source=("iscan-network-nt.deb::https://download3.ebz.epson.net/dsc/f/03/00/03/61/60/036fa32e8febc77061170283f84b6b1632949b23/${_pkgintname}_${_pkgver}_i386.deb")
fi


build() {
cd $srcdir
bsdtar -xf data.tar.gz
}

package() {
cd $srcdir
cp -R usr $pkgdir
install -Dm644 usr/share/doc/${_pkgintname}/AVASYSPL.en.txt $pkgdir/usr/share/licenses/${pkgname}/AVASYSPL
} 