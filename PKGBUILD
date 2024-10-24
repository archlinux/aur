# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname="obfuscation-tunnel"
pkgname="${_pkgname}-service"
pkgver=0.1.1
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
sha256sums=('b4f8da406617d483bdc483a7b71302e585c8f5488b0d81144641b9280020a1a9'
            '6eb6c7003a63b1a8a1c77500bfb71acf1ca2e8cb57b3f9e491d0a4d4a2d49ea5'
            '866744d8111f9663bf46a240d22c41ad214816370f9c08b817778502ab75dab8')
validpgpkeys=()

package() {
	install -D -m644 ${startdir}/example.conf "${pkgdir}/etc/${_pkgname}/example.conf"
	install -D -m644 ${startdir}/obfuscation-tunnel@.service "${pkgdir}/usr/lib/systemd/system/obfuscation-tunnel@.service"
	install -D -m755 ${startdir}/obfuscation-tunnel-launcher "${pkgdir}/usr/lib/${_pkgname}/obfuscation-tunnel-launcher"
}
