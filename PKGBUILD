# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=autoenv
pkgver=0.2.1
pkgrel=1
pkgdesc='Directory-based environments'
url="https://github.com/kennethreitz/${pkgname}"
license=('custom')
checkdepends=('bash' 'zsh' 'dash')
conflicts=("${pkgname}-git")
source=(https://github.com/kennethreitz/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('0b3c1e391ad6cc6eee8d8d005c50abcdd6ae5987ffb7ce003ba04f0aa9f44213063e0d87b62637690eae2fe67f3c1df359707c6c526d0d9abcc90a7a42a7ff76')
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
