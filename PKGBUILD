# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
pkgname=vampire
pkgver=4.2.2
pkgrel=1
pkgdesc='A theorem prover for first-order logic'
arch=('x86_64')
url='https://vprover.github.io/'
license=('custom:Vampire Software Licence Agreement')
source=("https://github.com/vprover/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('732de52ad7dcb39c111edb596c1c915922e88c55d0c2f4c108a111fa1fe13e54eeae917e760802c81f67be729ab977b1417a3cb7dd42ad5ba0c9b9f061ebbab7')

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
