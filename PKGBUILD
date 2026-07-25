# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter
pkgver=2.2.0
pkgrel=1
pkgdesc="A pulseaudio and pipewire audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('x86_64')
license=('MIT')
depends=('pipewire-pulse' 'gtk3' 'libayatana-appindicator' 'python' 'python-gobject' 'python-pydantic' 'python-pulsectl' 'python-pulsectl-asyncio')
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel' 'python-babel')
optdepends=('easyeffects')
provides=('pulsemeeter')
conflicts=('pulsemeeter-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ee51d9d3208de0bc4e69baa990ccee2bf12e61aacb3d473464430b80c3a225e')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
