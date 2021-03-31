# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_name=pEpPythonAdapter
pkgname=python-pep-adapter-git
pkgver=2.1.3
pkgrel=1
pkgdesc="p≡p Python adapter"
url="https://gitea.pep.foundation/pEp.foundation/pEpPythonAdapter"
depends=('python' 'pep-engine' 'boost' 'boost-libs' 'gcc')
makedepends=('git' 'python')
optdepends=()
license=('GPL3')
arch=('any')
source=("git+https://gitea.pep.foundation/pEp.foundation/pEpPythonAdapter.git")
sha256sums=('SKIP')
provides=('python-pep-adapter')

pkgver() {
	cd "$srcdir/${_name}"
	git tag | grep '^[0-9]' | sort -V -r | head -n1
}

build() {
	cd "$srcdir/${_name}"
	python setup.py build_ext
}

package() {
	cd "$srcdir/${_name}"
	python setup.py install --root="$pkgdir" --optimize=1
}
