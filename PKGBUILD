# Maintainer: Matthias Gliwka <mg@cerebuild.com>

pkgname=codota-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="Codota: Artificial pair programmer that learns from existing code (official binary version)"
arch=('x86_64')
url="https://www.codota.com/"
license=('custom: EULA')
provides=('codota')
depends=('libxss' 'gcc-libs-multilib' 'gtk2' 'alsa-lib' 'gconf' 'nss' 'libxtst')
source=('http://assets.codota.com/terms/codota_terms.pdf' 'https://d3h4gxz94r12wi.cloudfront.net/linux/x64/Codota_0.5.7_amd64.deb')
sha256sums=('e03cb9d2867609cd2b7dd5f755dec43a72462628e1b8ab64fbe1629194210a36' '40b25f2de8c7efb5bf827f1729d02063ace0eaee7cb0065b85c2343ff22002fe')

package() {
	# extract deb file
	cd "${srcdir}"
	tar xf data.tar.xz -C "${pkgdir}"

	# install license file
	install -Dm644 codota_terms.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.pdf
}