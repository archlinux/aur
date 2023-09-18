# Maintainer: Arnaud Gissinger <agissing@student.42.fr>
pkgname=rofi-notion
pkgver=2.0.3
pkgrel=4
pkgdesc="Quickly create new Notion pages for your databases with rofi as GUI."
arch=('any')
url="https://github.com/mathix420/rofi-notion"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-setuptools' 'pyinstaller')
provides=('rofi-notion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathix420/rofi-notion/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	rm .python-version
	pip install .
	pyinstaller stub.py --onefile --clean -n ${pkgname}
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "./dist/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
