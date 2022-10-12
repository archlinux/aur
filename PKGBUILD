# Maintainer: AkechiShiro <akechishiro-aur at lahfa dot xyz>

_pyname=openstep-parser
pkgname=python-${_pyname}-git
pkgver=1.5.4
pkgrel=1
pkgdesc='OpenStep plist parser and writer written in Cython'
arch=(x86_64)
url="https://github.com/kronenthaler/$_pyname"
license=(BSD)
depends=(python)
conflicts=(python-openstep-plist)
provides=(python-openstep-parser)
makedepends=(cython
             python-setuptools-scm)
checkdepends=(python-pytest)
source=("git+https://github.com/kronenthaler/$_pyname")
sha256sums=(SKIP)

build() {
	cd "$_pyname"
	python setup.py build
}

check() {
	cd "$_pyname"
	python setup.py test
}

package() {
	cd "$_pyname"
	python setup.py install --root="$pkgdir" --optimize=1
}
