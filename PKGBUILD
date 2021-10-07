# Contributor: Jelle van der Waa <jelle@archlinux.org>
_name=aiomeasures
pkgname=python-aiomeasures
pkgver=0.5.14
pkgrel=2
pkgdesc="Collect and send metrics to StatsD"
arch=('any')
url="https://lab.errorist.xyz/abc/aiomeasures"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-aiohttp')
source=("https://lab.errorist.xyz/abc/aiomeasures/-/archive/v${pkgver}/aiomeasures-v${pkgver}.tar.gz")
md5sums=('2f7d97c2e5bbc795d1e480cdfccaf4f8')
build() {
	cd "$_name-v$pkgver"
	python setup.py build
}

package() {
	cd "$_name-v$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}