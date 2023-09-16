# Maintainer: Arnaud Gissinger <agissing@student.42.fr>
pkgname=rofi-notion
pkgver=2.0.2
pkgrel=1
pkgdesc="Quickly create new Notion pages for your databases with rofi as GUI."
arch=('any')
url="https://github.com/mathix420/rofi-notion"
license=('MIT')
depends=('python>=3.7')
makedepends=(python-build python-installer)
provides=('rofi-notion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mathix420/rofi-notion/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	rm .python-version
	python -m build --wheel # --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
