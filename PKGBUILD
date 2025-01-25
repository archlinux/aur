pkgname=python-chibi-git
_pyname=chibi_git
pkgver=0.0.1
pkgrel=2
pkgdesc="wrapper to use git in python"
arch=('any')
url="https://pypi.org/project/chibi-git/"
license=('WTFPL')
groups=()
depends=( "python-chibi" "python-chibi-atlas" "python-chibi-command" "python" )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('800b1ab5187d2f743ef2b12f057957cf80f83f1724984417f716befe3bc781ab')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
