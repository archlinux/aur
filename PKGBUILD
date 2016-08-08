# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=autoenv
pkgver=0.2.0
pkgrel=1
pkgdesc='Directory-based environments'
url="https://github.com/kennethreitz/${pkgname}"
license=('custom')
checkdepends=('bash' 'zsh' 'dash')
conflicts=("${pkgname}-git")
source=(https://github.com/kennethreitz/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('d5c0d90e9bd641524636bf898f4c31c26c699fa7b9f641801cd1f3bf507b16d5d8e5e02a9dad9d8aa69d1a6b9125520b3d832c0388d05150b10ff41b4425359b')
arch=('any')
install='autoenv.install'

check() {
	cd "${pkgname}-${pkgver}"

	make test
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm644 activate.sh "${pkgdir}/usr/share/autoenv/activate.sh"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
