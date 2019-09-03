# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Eugene Dvoretsky <radioxoma at gmail dot com>
pkgname=python-gpxpy
pkgver=1.3.5 
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
sha256sums=('faf91da30f8445071aef4ecbb73aac50c8783532aed0837aa7ca4e7aa8346217')

check() {
	cd "${srcdir}/gpxpy-${pkgver}"
	python -m unittest test
}

package() {
   cd "${srcdir}/gpxpy-${pkgver}"
   python setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
