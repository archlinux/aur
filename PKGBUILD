# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Eugene Dvoretsky <radioxoma at gmail dot com>
pkgname=python-gpxpy
pkgver=1.4.0
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=('Apache')
depends=('python>=3.2' 'python-lxml>=3.1.2')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/tkrajina/gpxpy/archive/v${pkgver}.tar.gz")
sha256sums=('654ae1a5c0e0ad179fc5f96ec8c91fe03642881de3df6d85a7a8877c212a0210')

check() {
	cd "${srcdir}/gpxpy-${pkgver}"
	python -m unittest test
}

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
