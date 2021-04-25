# Maintainer: DisLogicator <supasecrethacker@gmail.com>
#PKGBUILD made by Jhyub

_referer="Referer: https://www.hancom.com/"
DLAGENTS=("https::/usr/bin/curl -o %o -H ${_referer// /\\ } %u")

pkgname='hncviewer'
pkgver=9.20.0.1573
pkgrel=3
pkgdesc='An official HWP viewer for Linux by Hancom. PKGBUILD made by Jhyub and all rights reserved for that user.Dependency issues fixed from original package.'
arch=('x86_64')
url='https://www.hancom.com/'
license=('custom:hwpviewer')
depends=('gtk3' 'webkitgtk' 'gvfs' 'icu68')
optdepends=()
source=("https://cdn.hancom.com/pds/hnc/VIE/hancomoffice-hwpviewer-Ubuntu-amd64.deb" "LICENSE")
sha512sums=(
	'ae8c1a8ed4ca2b09d24a7749c54f2a02ca6105814a82e389074a495e0b4022865c02aa6c6507f54d3283fa0d0a675a4578ea66b595bd47f83714a4e00be7802b'
	'3d26f57ebbeeb1d54d80b604a376c93a8df82cbab67a4a3eb18f2d3aed99611a40ca183859a16ceb51fe89d4b9823b232cb3100b80e0a9ff355b0fc43c813620'
)

package() {
	msg2 "Extracting data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	install -Dm644 license.txt "$pkgdir/usr/share/licenses/hwpviewer/license.txt"
}

