pkgname=python-chibi
_pyname=chibi
pkgver=0.19.0
pkgrel=1
pkgdesc="python snippets and other useful things"
arch=('any')
url="https://pypi.org/project/chibi/"
license=('WTFPL')
groups=()
depends=("python-magic" "python-dateutils" "python-xmltodict" "python-yaml" "python-chibi-donkey" "python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('1e68947f7ffc77e16031e4296885be45e1845cc2ebac521697afae1c07ff948b')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
