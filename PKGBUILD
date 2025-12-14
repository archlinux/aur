# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=legendary-rare
pkgver=1.12.0
pkgrel=2
pkgdesc="A free and open-source replacement for the Epic Games Launcher (Rare fork)"
arch=('any')
url="https://github.com/RareDevs/legendary/"
license=('GPL-3.0-or-later')
depends=(
	'python-filelock'
	'python-requests'
	'python-requests-futures'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
optdepends=('python-pywebview: Login support')
provides=('legendary')
conflicts=('legendary')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rare-$pkgver.tar.gz")
sha256sums=('6e10264134f0757c07270e5812655e39456b16405fa8e1be1ca9a5b6ed7fc3bb')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
