# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=2.3.0
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://flent.org'
license=('GPL')
depends=('python' 'netperf')
makedepends=(python-build python-installer python-wheel)
conflicts=('netperf-wrapper')
replaces=('netperf-wrapper')
optdepends=(
    'python-matplotlib: for outputting graphs'
    'python-qtpy: for the GUI'
)
source=(https://files.pythonhosted.org/packages/source/f/flent/flent-${pkgver}.tar.gz)
sha256sums=('ab2f81bcca410c1b41a8410cf72124a3f19bda9bacc45fcbaa2bad48a952d9e1')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

        python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
