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
source=( 'obfuscation-tunnel@.service' 'obfuscation-tunnel-starter' 'example.conf' )
noextract=()
sha256sums=('1e06caea2aecb5f6473aa7668aca318d4cd498750aa1e9e18c7b60f38271acff'
            'b8cf8528c49b1ff99f0fe7a7d31239bb0a20fcbd7274d2a8a8e7ae0daedc6066'
            '34c925897901c6d23de9da50ab1b42755e50090ae468803cc4f4953cc2a6a477')
validpgpkeys=()

builddir=${_pkgname}

package() {
	cd "$builddir"

	install -D -m644 ${startdir}/example.conf "${pkgdir}/etc/${_pkgname}/example.conf"
	install -D -m644 ${startdir}/obfuscation-tunnel@.service "${pkgdir}/usr/lib/systemd/system/obfuscation-tunnel@.service"
	install -D -m755 ${startdir}/obfuscation-tunnel-starter "${pkgdir}/usr/lib/${_pkgname}/obfuscation-tunnel-starter"
}
