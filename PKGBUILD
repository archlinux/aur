# Maintainer: Theo Bertacchini theo.bertacchini@epitech.eu
pkgname=blih
pkgver=1.7
pkgrel=4
pkgdesc="Bocal Lightweight Interface for Humans, git repositories and SSH public keys management tool for EPITECH students"
arch=('any')
url="https://intra-bocal.epitech.eu"
license=('BSD')
depends=('python>=3.3.0'
	'python-requests'
	'git')
provides=('blih')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bocal/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}-${pkgver}"
	sed -i s/python3.3/python/ "${pkgname}.py"
}

build() {
	cd "${pkgname}-${pkgver}"
	mv "${pkgname}.py" "${pkgname}"
	chmod 755 "${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin"
}
