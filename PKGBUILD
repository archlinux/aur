pkgname=python-ropevim
_pyname=ropevim
pkgver=0.8.1
pkgrel=1
pkgdesc="Ropevim is a vim mode that uses rope library to provide features like python refactorings and code-assists."
arch=('any')
url="https://pypi.org/project/ropevim/"
license=('WTFPL')
groups=()
depends=("ropemode" "python-rope" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('7795dcf49be54f61727cfb7e5bfc3e23ef4dc09c1b65721730b1fbdafd623725')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
