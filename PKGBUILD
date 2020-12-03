# Maintainer:  Alex Avance <aravance at gmail dot com>

_pkgname=sparklines
_author=deeplook
pkgname=python-${_pkgname}
pkgver=0.4.2
pkgrel=1
pkgdesc="Bindings for sparklines library."
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/${_author}/${_pkgname}/master/LICENSE.txt")
sha256sums=('7c33fd6dc8b277b1fd729b31428df58a785c68be58202f439128e815f1dcae88'
            'd62f065830aa3739cc031156b9690805c7b2e811b4a178c8b4acd8725d561c94')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
