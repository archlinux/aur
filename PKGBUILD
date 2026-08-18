# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
# Contributor: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Nicholas Wang <me AT nicho1as DOT wang>

pkgname=('python-timezonefinder')
pkgdesc="python package for finding the timezone of any point on earth (coordinates) offline"
pkgver=8.2.5
pkgrel=1
url="https://github.com/jannikmi/timezonefinder"
license=('MIT')
arch=('any')
depends=('python-h3' 'python-numpy' 'python-cffi' 'python-flatbuffers')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-poetry-core')
source=("https://github.com/jannikmi/timezonefinder/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d8f41cd6deb333592e9419a1a249cca6ff5e4c2fb760b6c2e5ca61b7a4d56a6e2ad84abd63c385c0282631f4b362815377100b8da0d5b0199e4608bd62e010da')

build() {
  python -m build --no-isolation --wheel --outdir ${srcdir}/dist/ ${srcdir}/timezonefinder-${pkgver}
}

package() {
  python -m installer --destdir="$pkgdir" ${srcdir}/dist/*.whl
}
