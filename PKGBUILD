# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=wifi-heat-mapper
_name=whm
pkgver=0.2.5
pkgrel=1
pkgdesc="A Python library for benchmarking Wi-Fi networks to create heatmaps"
arch=('any')
url="https://github.com/nischay-pro/wifi-heat-mapper"
license=('GPL3')
depends=('python>=3.7' 'python-iperf3' 'python-matplotlib' 'python-tqdm'
         'python-pillow' 'python-scipy' 'python-numpy' 'python-pysimplegui')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-versioneer-518')
optdepends=('speedtest-cli')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b8396cd52026dfe31ae4f6016303c362a48ed8f248fa5490bd1de24b363a5e52')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
