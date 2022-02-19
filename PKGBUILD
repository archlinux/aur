# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=pcaper
pkgver=1.0.11
pkgrel=2
pkgdesc='Read pcap and assemble HTTP requests'
arch=(any)
url="https://github.com/gaainf/$pkgname"
license=(BSD)
depends=(
	python
	'python-dpkt>=1.9.1'
	'python-six>=1.11.0'
	'python-dateutil>=2.8.0'
)
makedepends=(python-build python-installer)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('65f9aea7ec97f42fbdf10ae8a6695226fe773499ef2eb477c724f998d7972075')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
