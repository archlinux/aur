# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname="obfuscation-tunnel"
pkgname="${_pkgname}-service"
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Systemd service for Obfuscation-Tunnel"
arch=( 'any' )
license=('BSD')
groups=()
depends=( "${_pkgname}" "bash>=4.0.0" "systemd" )
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=( 'obfuscation-tunnel@.service' 'obfuscation-tunnel-launcher' 'example.conf' )
noextract=()
sha256sums=('9cd80d8f2c20909806ee66f88dc8141e90ad15d855a460b029bbd0d82739b2f5'
            '6eb6c7003a63b1a8a1c77500bfb71acf1ca2e8cb57b3f9e491d0a4d4a2d49ea5'
            '665b490dfd185426fb6c30a1ed470e4810ef4d09d137beb636444d364c0b9803')
validpgpkeys=()

package() {
	install -D -m644 ${startdir}/example.conf "${pkgdir}/etc/${_pkgname}/example.conf"
	install -D -m644 ${startdir}/obfuscation-tunnel@.service "${pkgdir}/usr/lib/systemd/system/obfuscation-tunnel@.service"
	install -D -m755 ${startdir}/obfuscation-tunnel-launcher "${pkgdir}/usr/lib/${_pkgname}/obfuscation-tunnel-launcher"
}
