# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname="Obfuscation-Tunnel"
pkgname="${_pkgname,,}-service"
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Obfuscate UDP traffic to hide from deep packet inspection"
arch=('any')
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgname,,}")
conflicts=("${_pkgname,,}")
replaces=()
backup=()
options=()
install=
changelog=
source=( 'obfuscation-tunnel@.service' 'obfuscation-tunnel-launcher' 'example.conf' )
noextract=()
sha256sums=('9cd80d8f2c20909806ee66f88dc8141e90ad15d855a460b029bbd0d82739b2f5'
            'd7cad332e107dc191999522ee06127117ed192f2129ca6bec60eb382b2883273'
            '665b490dfd185426fb6c30a1ed470e4810ef4d09d137beb636444d364c0b9803')
validpgpkeys=()


package() {
	install -D -m644 ${startdir}/example.conf "${pkgdir}/etc/${_pkgname}/example.conf"
	install -D -m644 ${startdir}/obfuscation-tunnel@.service "${pkgdir}/usr/lib/systemd/system/obfuscation-tunnel@.service"
	install -D -m755 ${startdir}/obfuscation-tunnel-launcher "${pkgdir}/usr/lib/${_pkgname}/obfuscation-tunnel-launcher"
}
