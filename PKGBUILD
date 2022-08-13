# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Eugene Dvoretsky <radioxoma at gmail dot com>
pkgname=python-gpxpy
pkgver=1.5.0
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
sha256sums=('4fd0afe9f8858d340a1481a7ef05de0be498ce19c1e1535407b58b7f1f02d456')

check() {
	cd "${srcdir}/gpxpy-${pkgver}"
	python -m unittest test
}

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
