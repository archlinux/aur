pkgname=python-chibi-git
_pyname=chibi_git
pkgver=0.0.3
pkgrel=1
pkgdesc="wrapper to use git in python"
arch=('any')
url="https://pypi.org/project/chibi-git/"
license=('WTFPL')
groups=()
depends=( "python-chibi" "python-chibi-atlas" "python-chibi-command" "python" )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('8ee78b5e2939efcc5538a9d70389c150aa75c2b6e1fc3bef33612bb42de765f6')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
