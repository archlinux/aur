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
            '385875614676576f2709ab6461ad7aea8975feeb7e6ac014798b5bf50c28d1cd'
            '34c925897901c6d23de9da50ab1b42755e50090ae468803cc4f4953cc2a6a477')
validpgpkeys=()


package() {
	install -D -m644 ${startdir}/example.conf "${pkgdir}/etc/${_pkgname}/example.conf"
	install -D -m644 ${startdir}/obfuscation-tunnel@.service "${pkgdir}/usr/lib/systemd/system/obfuscation-tunnel@.service"
	install -D -m755 ${startdir}/obfuscation-tunnel-launcher "${pkgdir}/usr/lib/${_pkgname}/obfuscation-tunnel-launcher"
}
