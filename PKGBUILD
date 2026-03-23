pkgname=python-chibi-git
_pyname=chibi_git
pkgver=0.9.1
pkgrel=1
pkgdesc="wrapper to use git in python"
arch=('any')
url="https://pypi.org/project/chibi-git/"
license=('WTFPL')
groups=()
depends=( "python-chibi" "python-chibi-atlas" "python-chibi-command" "python" )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('b535ce38bef92a19a96e28864ced5c7cbbdf8e612ace04aca87906e39d72194e')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
