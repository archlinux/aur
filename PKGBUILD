# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
# Contributor: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Nicholas Wang <me AT nicho1as DOT wang>

pkgname=('python-timezonefinder')
pkgdesc="Fast and lightweight project for looking up the timezone for a given lat/lng"
pkgver=6.5.0
pkgrel=2
url="https://github.com/MrMinimal64/timezonefinder"
license=('MIT')
arch=('any')
depends=('python-h3')
makedepends=('python-numpy' 'python-build' 'python-installer' 'python-setuptools' 'python-cffi'  'python-poetry-core')
source=("https://github.com/jannikmi/timezonefinder/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d28f633c86a4affb4b47b37ef6dc3339033d705dca27817b9f2ff34027d1c773')

build() {
  python -m build --no-isolation --wheel --outdir ${srcdir}/dist/ ${srcdir}/timezonefinder-${pkgver}
}

package() {
  python -m installer --destdir="$pkgdir" ${srcdir}/dist/*.whl
}
