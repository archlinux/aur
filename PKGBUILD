pkgname=python-chibi-git
_pyname=chibi_git
pkgver=0.2.0
pkgrel=1
pkgdesc="wrapper to use git in python"
arch=('any')
url="https://pypi.org/project/chibi-git/"
license=('WTFPL')
groups=()
depends=( "python-chibi" "python-chibi-atlas" "python-chibi-command" "python" )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('443ceafd19dacb5dfef47af7ec2f64d89da702cbc9558bbb2ce2708f9ec57c62')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
