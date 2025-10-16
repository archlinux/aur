# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
# Contributor: Łukasz Pożarlik <lpozarlik@gmail.com>
# Contributor: Nicholas Wang <me AT nicho1as DOT wang>

pkgname=('python-timezonefinder')
pkgdesc="Fast and lightweight project for looking up the timezone for a given lat/lng"
pkgver=8.1.0
pkgrel=1
url="https://github.com/MrMinimal64/timezonefinder"
license=('MIT')
arch=('any')
depends=('python-h3' 'python-numpy' 'python-cffi' 'python-flatbuffers')
makedepends=('python-build' 'python-installer' 'python-setuptools'  'python-poetry-core')
source=("https://github.com/jannikmi/timezonefinder/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('d780b6749c60df57cbe46df947534c2f42ba3aadf08c366aa7ff2cc104e2c2b6acef50e185964e5a2951b1e72ef168df80fc7fae1090cc20f0e1b0cc4eaedff5')

build() {
  python -m build --no-isolation --wheel --outdir ${srcdir}/dist/ ${srcdir}/timezonefinder-${pkgver}
}

package() {
  python -m installer --destdir="$pkgdir" ${srcdir}/dist/*.whl
}
