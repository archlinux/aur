# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
pkgname=vampire
pkgver=4.4
pkgrel=1
pkgdesc='A theorem prover for first-order logic'
arch=('x86_64')
url='https://vprover.github.io/'
license=('custom:Vampire Software Licence Agreement')
source=("https://github.com/vprover/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('774452836e4cc6b7f2bcffc581b2fec0f15574adb58b4ab9fb3c771392aee2d34073129b8be32d73927f6613e83785e5d3d2ab161fe4eb09a039a0dee983a31a')

build() {
	cd "${pkgname}-${pkgver}"
	make vampire_rel BRANCH= COM_CNT=
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D "${pkgname}_rel__" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -D -m644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
