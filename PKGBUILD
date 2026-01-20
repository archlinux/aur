# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>

pkgname=flent
pkgver=2.2.0
pkgrel=4
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
sha256sums=('04fc21de858863560423e79c822f405225f829afd8e5d62293099fbef341f9e8')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"

        python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
}
